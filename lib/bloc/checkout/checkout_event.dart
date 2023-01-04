part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateChechout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  // final List<Product>? products;
  // final String? subtotal;
  // final String? deliveryFree;
  // final String? total;
  //! the card is added here instead of product-list,subtotal,deliveryFree and total because when we are on the checkout screen the cart block is already initialized
  final Cart? cart;

  const UpdateChechout(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.cart});
  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        cart,
      ];
}

class ConfirmChechout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmChechout({required this.checkout});
  @override
  List<Object?> get props => [checkout];
}
