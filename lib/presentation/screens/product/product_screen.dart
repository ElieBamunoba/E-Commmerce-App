import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
