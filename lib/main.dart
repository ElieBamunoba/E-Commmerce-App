import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: route.onGeneratedRoute,
      initialRoute: route.homeScreen,
    );
  }
}
