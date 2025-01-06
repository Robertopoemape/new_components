import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleCardListScreen extends StatelessWidget {
  const ExampleCardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JcCardOption(
            titleName: 'Recargar puntos',
            onPressed: () {},
          ),
          JcCardOption(
            titleName: 'Transferir puntos',
            onPressed: () {},
          ),
          JcCardOption(
            titleName: 'Reporte de recargas',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
