import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleCardProductsScreen extends StatefulWidget {
  const ExampleCardProductsScreen({super.key});

  @override
  State<ExampleCardProductsScreen> createState() =>
      _ExampleCardProductsScreenState();
}

class _ExampleCardProductsScreenState extends State<ExampleCardProductsScreen> {
  int totalQuantity = 0;
  int totalQuantity2 = 0;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estilo primario',
              style: JcTextStyle.h6.inf500,
            ),
            gap8,
            JcCardProduct.primary(
              nameTitle: 'MARQUESITA DE LECHE CONDENSADA CON QUESO Y '
                  'PALTA Y FRESA Y CHOCOLATE',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              onChanged: (value) {},
              onPressed: () {
                totalQuantity++;
              },
              currentQuantity: totalQuantity,
              stock: 10,
              price: 10,
            ),
            gap8,
            Text(
              'Estilo secundario',
              style: JcTextStyle.h6.inf500,
            ),
            gap8,
            JcCardProduct.secondary(
              onRemoveProduct: () {},
              nameTitle: 'Viva Mexico 2024',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              onPressed: () {
                totalQuantity2++;
              },
              onChanged: (value) {},
              currentQuantity: totalQuantity2,
              stock: 10,
              price: 10,
            ),
          ],
        ),
      ),
    );
  }
}
