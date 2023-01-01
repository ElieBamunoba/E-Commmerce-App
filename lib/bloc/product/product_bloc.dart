import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model.dart';
import '../../repositories/product/poduct_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  late StreamSubscription productStreamSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(event, Emitter<ProductState> emit) async {
    productStreamSubscription = _productRepository.getAllProducts().listen(
      (products) {
        return add(
          UpdateProducts(products: products),
        );
      },
    );
  }

  void _onUpdateProducts(event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: event.products));
  }
}
