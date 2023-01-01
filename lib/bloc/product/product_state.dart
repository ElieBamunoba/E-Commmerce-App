part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded({
    //initialy the list of produts is an empty list
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [products];
}
