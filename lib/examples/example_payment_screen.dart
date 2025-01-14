import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExamplePaymentScreen extends StatelessWidget {
  const ExamplePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          JcDetailProduct(
            imageUrl: JcImg.noImg.path,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.payment(
              onPressed: () {},
              onPressedCancel: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
