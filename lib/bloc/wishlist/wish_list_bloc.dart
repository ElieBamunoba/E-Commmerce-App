import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/model.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishList>(_onStartWishlist);
    on<AddWishListProduct>(_onAddWishlistProduct);
    on<RemoveWishListProduct>(_onRemoveWishlistProduct);
  }

  void _onStartWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {}
  }

  void _onAddWishlistProduct(event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)..add(event.product),
          ),
        ));
      } catch (_) {}
    }
  }

  void _onRemoveWishlistProduct(event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)..remove(event.product),
          ),
        ));
      } catch (_) {}
    }
  }
}
