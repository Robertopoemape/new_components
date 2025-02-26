import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/examples/example_card_products_screen.dart';

@RoutePage()
class ExampleBaseListSearchScreen extends StatelessWidget {
  const ExampleBaseListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExampleCardProductsScreen(),
          ],
        ),
      ),
    );
  }
}
