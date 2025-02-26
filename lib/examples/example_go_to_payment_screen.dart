import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleGoToPaymentScreen extends StatelessWidget {
  const ExampleGoToPaymentScreen({super.key});

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
            child: JcFloatingBase.goToPayment(
              labelTotal: '2',
              labelCount: '2',
              onPressed: () async {
                log('entro');
                await Future.delayed(const Duration(seconds: 5), () {
                  log('salio');
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
