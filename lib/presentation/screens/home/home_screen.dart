import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/category/category_bloc.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'E-Commerce',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          //!recommended product
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SectionTitle(
              title: 'RECOMMENDED',
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          //!Most popular
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SectionTitle(
              title: 'MOST POPULAR',
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular)
                      .toList(),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ],
      ),
    );
  }
}
