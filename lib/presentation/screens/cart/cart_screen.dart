import 'package:flutter/material.dart';

import '/presentation/routes/app_router.dart' as routes;
import '/bloc/bloc.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routes.checkoutScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, routes.homeScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(),
                            ),
                            child: Text(
                              'Add more Items',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //! The list of the products added in the cart
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.54,
                        child: ListView.builder(
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              productQuantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const OrderSummary(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Something went Wrong'),
            );
          }
        },
      ),
    );
  }
}
