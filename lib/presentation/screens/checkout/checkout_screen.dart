import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '/presentation/routes/app_router.dart' as routes;

class CheckoutScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routes.catalogScreen),
      builder: (context) => const CheckoutScreen(),
    );
  }

  const CheckoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'CheckOut',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routes.checkoutScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'COSTOMER INFORMATION'),
            CustomInputTextField(
              context: context,
              lable: 'Email',
              controller: addressController,
            ),
            CustomInputTextField(
              context: context,
              lable: 'Full Name',
              controller: cityController,
            ),
            const SectionTitle(title: 'DELIVERY INFORMATION'),
            CustomInputTextField(
              context: context,
              lable: 'Address',
              controller: addressController,
            ),
            CustomInputTextField(
              context: context,
              lable: 'City',
              controller: cityController,
            ),
            CustomInputTextField(
              context: context,
              lable: 'Country',
              controller: countryController,
            ),
            CustomInputTextField(
              context: context,
              lable: 'Zip Code',
              controller: zipCodeController,
            ),
            const SectionTitle(title: 'ORDER SUMMARY'),
            const OrderSummary(),
          ],
        ),
      ),
    );
  }
}
