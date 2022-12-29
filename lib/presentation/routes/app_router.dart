//Routes Names
import '/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

const String homeScreen = '/';
const String cartScreen = '/card';
const String profileScreen = '/profile';
const String productScreen = '/product';
const String wishlistScreen = '/wishlist';
const String catalogScreen = '/catalog';

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
      return MaterialPageRoute(builder: (context) => const ProductScreen());
    case catalogScreen:
      return MaterialPageRoute(builder: (context) => const CatalogScreen());
    case wishlistScreen:
      return MaterialPageRoute(builder: (context) => const WishListScreen());
    default:
      throw ('This rout name does not exist');
  }
}
