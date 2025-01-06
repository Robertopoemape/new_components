import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';

@RoutePage()
class ExampleCardProductsScreen extends StatefulWidget {
  const ExampleCardProductsScreen({super.key});

  @override
  State<ExampleCardProductsScreen> createState() =>
      _ExampleCardProductsScreenState();
}

class _ExampleCardProductsScreenState extends State<ExampleCardProductsScreen> {
  int totalQuantity = 0;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JcCardProduct.primary(
            nameTitle: 'MARQUESITA DE LECHE CONDENSADA CON QUESO Y '
                'PALTA Y FRESA Y CHOCOLATE',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onChanged: (value) {
              totalQuantity = value.quantity;
              totalPrice = value.price;
            },
            onPressed: () {},
            currentQuantity: 1,
            stock: 1,
            price: 10,
          ),
          JcCardProduct.secondary(
            onRemoveProduct: () {},
            nameTitle: 'Viva Mexico 2024',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onPressed: () {},
            onChanged: (value) {
              log(value.quantity.toString());
              log(value.price.toString());
            },
            currentQuantity: 1,
            stock: 1,
            price: 10,
          ),
        ],
      ),
    );
  }
}
