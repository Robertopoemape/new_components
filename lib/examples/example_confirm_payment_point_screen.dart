import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';

@RoutePage()
class ExampleConfirmPaymentPointScreen extends StatelessWidget {
  const ExampleConfirmPaymentPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = <Product>[
      Product(
        nameProduct: 'Taco al Pastor',
        quantity: 20,
      ),
      Product(
        nameProduct: 'Nachos con Guacamole y Pico de Gallo',
        quantity: 10,
      ),
      Product(
        nameProduct: 'Coca-Cola 500 ml',
        quantity: 30,
      ),
      Product(
        nameProduct: 'Taco al Pastor',
        quantity: 20,
      ),
      Product(
        nameProduct: 'Nachos con Guacamole y Pico de Gallo',
        quantity: 10,
      ),
      Product(
        nameProduct: 'Coca-Cola 500 ml',
        quantity: 30,
      ),
      Product(
        nameProduct: 'Taco al Pastor',
        quantity: 20,
      ),
      Product(
        nameProduct: 'Nachos con Guacamole y Pico de Gallo',
        quantity: 10,
      ),
      Product(
        nameProduct: 'Coca-Cola 500 ml',
        quantity: 30,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
      ),
      body: Stack(
        children: [
          Center(
            child: JcConfirmPaymentPoint.quaternary(
              totalAmountPoints: 400,
              points: 95,
              paymentMethod: 'Efectivo',
              destination: '[user-name or user-code]',
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.recharge(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 5), () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
