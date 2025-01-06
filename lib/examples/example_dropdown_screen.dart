import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_dropdown/jc_dropdown.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleDropdownScreen extends StatefulWidget {
  const ExampleDropdownScreen({super.key});

  @override
  State<ExampleDropdownScreen> createState() => _ExampleDropdownScreenState();
}

class _ExampleDropdownScreenState extends State<ExampleDropdownScreen> {
  List<String> paymentMethods = [
    'Efectivo',
    'Yape',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JcDropdown(
              items: paymentMethods,
              borderColor: JcColors.sec600,
              messageLabel: 'Método de pago',
              borderRadius: 4,
              hintText: 'Selecciona el método',
              onChanged: (value) {},
              initialValue: 'asdsa',
            ),
            gap8,
            JcDropdown(
              items: paymentMethods,
              borderColor: JcColors.sec600,
              messageLabel: 'Método de pago',
              borderRadius: 4,
              hintText: 'Seleciona el documento',
            ),
            gap8,
            JcInput(
              hintText: 'N° Documento',
              onChanged: (value) {},
              //   iconInsideInput: Icons.check_circle,
              styleSizeInput: StyleSizeInput.large,
              isOptionalField: true,
              borderColor: JcColors.sec600,
              borderRadius: 4,
              widthBorder: 1,
            ),
            gap8,
            JcInput(
              hintText: 'Correo electrónico',
              onChanged: (value) {},
              iconInsideInput: Icons.check_circle,
              styleSizeInput: StyleSizeInput.large,
              isOptionalField: true,
              widthBorder: 1,
              borderColor: JcColors.sec600,
              borderRadius: 4,
            ),
            gap8,
            JcDropdown(
              items: paymentMethods,
              borderColor: JcColors.sec600,
              messageLabel: 'Método de pago',
              borderRadius: 4,
              hintText: 'Selecciona el método',
            ),
            gap8,
          ],
        ),
      ),
    );
  }
}
