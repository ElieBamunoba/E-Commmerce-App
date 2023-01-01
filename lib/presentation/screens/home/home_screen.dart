import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/category/category_bloc.dart';
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
          const SectionTitle(
            title: 'RECOMMENDED',
          ),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          //!Most popular
          const SectionTitle(
            title: 'MOST POPULAR',
          ),
          ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          )
        ],
      ),
    );
  }
}
