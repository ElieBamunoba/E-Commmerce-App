import 'package:ecommerce_app/bloc/wishlist/wish_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/routes/app_router.dart' as route;
import '/presentation/theme/theme.dart';

void main() {
  runApp(const MyApp());
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
        )
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
