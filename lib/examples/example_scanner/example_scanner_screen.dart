import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleScannerScreen extends StatelessWidget {
  const ExampleScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padSy16,
        child: Column(
          children: [
            gap48,
            gap16,
            ButtonScanner(
              backgroundColor: JcColors.gs500,
              label: 'Escanear',
              titleEvent: 'Escanear código QR',
              countryEvent: 'Escanear código de barras',
              onValueChanged: (code, type) {
                Navigator.pop(context);

                autoRouterPush(
                  context,
                  ExampleResultMessageScreenRoute(code: code),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'test',
              onPressed: () {
                autoRouterPush(
                  context,
                  ExampleResultMessageScreenRoute(code: 'test'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
