import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static Route get route => MaterialPageRoute(
        builder: (_) => const CheckoutScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Checkout'),
      ),
    );
  }
}
