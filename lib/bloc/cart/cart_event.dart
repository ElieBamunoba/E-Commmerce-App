part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class StartCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;
  const AddProductToCart({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final Product product;
  const RemoveProductFromCart({required this.product});

  @override
  List<Object> get props => [product];
}
