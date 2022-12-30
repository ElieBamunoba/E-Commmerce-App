import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
