import 'package:flutter/material.dart';

import '/presentation/routes/app_router.dart' as routes;
import '../../../models/model.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routes.catalogScreen),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.14,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) => Center(
          child: ProductCard(
            widthFactor: 2.2,
            product: categoryProducts[index],
          ),
        ),
      ),
    );
  }
}
