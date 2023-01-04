import 'package:ecommerce_app/models/model.dart';

import '/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

//Routes Names
const String homeScreen = '/';
const String cartScreen = '/card';
const String profileScreen = '/profile';
const String productScreen = '/product';
const String wishlistScreen = '/wishlist';
const String catalogScreen = '/catalog';
const String checkoutScreen = '/checkout';

//control pur page route flow
Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case cartScreen:
      return MaterialPageRoute(builder: (context) => const CartScreen());
    case profileScreen:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case productScreen:
      return MaterialPageRoute(
          builder: (context) => ProductScreen(
                product: settings.arguments as Product,
              ));
    case catalogScreen:
      return MaterialPageRoute(
        builder: (context) => CatalogScreen(
          category: settings.arguments as Category,
        ),
      );
    case wishlistScreen:
      return MaterialPageRoute(builder: (context) => const WishListScreen());
    case checkoutScreen:
      return MaterialPageRoute(builder: (context) => const CheckoutScreen());
    default:
      throw ('This rout name does not exist');
  }
}
