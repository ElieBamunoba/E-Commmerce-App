import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/routes/app_router.dart' as route;
import '/presentation/theme/theme.dart';
import 'bloc/cart/cart_bloc.dart';
import 'bloc/checkout/checkout_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'repositories/product/poduct_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishList()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(StartCart()),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())
            ..add(
              LoadProducts(),
            ),
        ),
        BlocProvider(
          create: (_) => CheckoutBloc(
            cartBloc: _.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: route.onGeneratedRoute,
        initialRoute: route.homeScreen,
      ),
    );
  }
}
