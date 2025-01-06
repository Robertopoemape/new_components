import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';

@RoutePage()
class ExampleGoToPaymentScreen extends StatelessWidget {
  const ExampleGoToPaymentScreen({super.key});

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
            child: JcFloatingBase.payment(
              onPressedCancel: () async {},
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
