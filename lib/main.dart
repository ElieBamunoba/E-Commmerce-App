import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';

import '/presentation/routes/app_router.dart' as route;
import '/presentation/theme/theme.dart';
import '/bloc/bloc.dart';
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
        //!WishList bloc
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishList()),
        ),
        //!Cart bloc
        BlocProvider(
          create: (_) => CartBloc()..add(StartCart()),
        ),
        //!Category Bloc
        BlocProvider(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
            ..add(
              LoadCategories(),
            ),
        ),
        //!Product Bloc
        BlocProvider(
          create: (_) => ProductBloc(productRepository: ProductRepository())
            ..add(
              LoadProducts(),
            ),
        ),
        //!Checkout bloc
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
