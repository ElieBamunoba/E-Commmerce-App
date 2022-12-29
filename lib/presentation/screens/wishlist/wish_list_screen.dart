import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wish List',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
