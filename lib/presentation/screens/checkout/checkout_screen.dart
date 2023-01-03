import 'package:flutter/material.dart';

import '/bloc/bloc.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'CheckOut',
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return BottomAppBar(
              color: Colors.black,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: null,
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
            );
          } else if (state is CheckoutLoaded) {
            return BottomAppBar(
              color: Colors.black,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CheckoutBloc>()
                            .add(ConfirmChechout(checkout: state.checkout));
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
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckoutLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 75 / 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(title: 'COSTOMER INFORMATION'),
                      CustomInputTextField(
                        context: context,
                        lable: 'Email',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(email: value));
                        },
                      ),
                      CustomInputTextField(
                        context: context,
                        lable: 'Full Name',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(fullName: value));
                        },
                      ),
                      const SectionTitle(
                        title: 'DELIVERY INFORMATION',
                      ),
                      CustomInputTextField(
                        context: context,
                        lable: 'Address',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(address: value));
                        },
                      ),
                      CustomInputTextField(
                        context: context,
                        lable: 'City',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(city: value));
                        },
                      ),
                      CustomInputTextField(
                        context: context,
                        lable: 'Country',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(country: value));
                        },
                      ),
                      CustomInputTextField(
                        context: context,
                        lable: 'Zip Code',
                        onChanged: (value) {
                          context
                              .read<CheckoutBloc>()
                              .add(UpdateChechout(zipCode: value));
                        },
                      ),
                      Container(
                        color: Colors.black,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SELECT A PAYMENT METHOD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.white),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SectionTitle(
                        title: 'ORDER SUMMARY',
                      ),
                      const OrderSummary(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
