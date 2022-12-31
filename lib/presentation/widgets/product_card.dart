import 'package:ecommerce_app/bloc/wishlist/wish_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/routes/app_router.dart' as route;

import '../../models/model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard({
    Key? key,
    this.isWishlist = false,
    this.leftPosition = 5.0,
    this.widthFactor = 2.5,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        route.productScreen,
        arguments: product,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            SizedBox(
              width: widthValue,
              height: 150,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                width: widthValue - 5 - leftPosition,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                width: widthValue - 15 - leftPosition,
                height: 70,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<WishlistBloc>(context).add(
                                    RemoveWishListProduct(
                                      product: product,
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${product.name} has be removed from your Wishlist'),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
