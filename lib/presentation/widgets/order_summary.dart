import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          return Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '\$${state.cart.subtotalString}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DElIVERY FEE',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '\$${state.cart.deliveryFeeString}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'TOTAL FEE',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${state.cart.totalString}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
