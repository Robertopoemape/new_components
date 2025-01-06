import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';

@RoutePage()
class ExampleDetailBuyScreen extends StatelessWidget {
  const ExampleDetailBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const JcDetailProduct(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.addToCart(
              onPressed: () {},
              onPressedMinus: () {},
              onPressedPlus: () {},
            ),
          ),
        ],
      ),
    );
  }
}
