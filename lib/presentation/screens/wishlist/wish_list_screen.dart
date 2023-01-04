import 'package:flutter/material.dart';

import '/bloc/bloc.dart';
import '../../widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Wish List',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistLoaded) {
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishList.products.length,
              itemBuilder: (context, index) => Center(
                child: ProductCard(
                  leftPosition: 100,
                  widthFactor: 1.1,
                  isWishlist: true,
                  product: state.wishList.products[index],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
