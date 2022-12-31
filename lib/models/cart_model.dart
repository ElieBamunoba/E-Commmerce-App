import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subttotal) {
    if (subtotal >= 30) {
      return 'You have Free Delivery';
    } else {
      double missing = 30 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  //returns the total price of the product items in the cart list as double
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  //returns the total price of the product items in the cart list as String
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
