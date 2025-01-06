import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExampleResultMessageScreen extends StatelessWidget {
  const ExampleResultMessageScreen({required this.code, super.key});
  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Listo! $code'),
            const Text('El pago se realizó con éxito'),
          ],
        ),
      ),
    );
  }
}
