import 'dart:async';

import 'package:ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc cartBloc;
  final CheckoutRepository _checkoutRepository;
  late StreamSubscription cartStreamSubscription;
  //late StreamSubscription _checkoutStreamSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                  deliveryFree:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                  total: (cartBloc.state as CartLoaded).cart.totalString,
                )
              : CheckoutLoading(),
        ) {
    cartStreamSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateChechout(cart: state.cart));
      }
    });
    on<UpdateChechout>(_onUpdateCheckout);
    on<ConfirmChechout>(_onConfirmCheckout);
  }

  void _onUpdateCheckout(event, Emitter<CheckoutState> emit) async {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFree: event.cart?.deliveryFee ?? state.deliveryFree,
          subtotal: event.cart?.subtotal ?? state.deliveryFree,
          total: event.cart?.total ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
        ),
      );
    }
  }

  void _onConfirmCheckout(event, Emitter<CheckoutState> emit) async {
    final state = this.state;
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoaded());
      } catch (_) {}
    }
  }
}
