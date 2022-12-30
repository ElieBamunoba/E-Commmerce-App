part of 'wish_list_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class AddWishListProduct extends WishlistEvent {
  final Product product;

  const AddWishListProduct({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveWishListProduct extends WishlistEvent {
  final Product product;

  const RemoveWishListProduct({required this.product});

  @override
  List<Object> get props => [product];
}
