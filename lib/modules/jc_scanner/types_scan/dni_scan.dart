import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class DniScan extends StatefulWidget {
  const DniScan({required this.onChangedCode, super.key});
  final Function(String) onChangedCode;

  @override
  State<DniScan> createState() => _DniScanState();
}

class _DniScanState extends State<DniScan> {
  final dniController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padSy16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JcInput(
              controller: dniController,
              hintText: 'Ingresa número de dni',
              label: 'Número de DNI',
              colorInputText: JcColors.gsWhite,
              onChanged: (value) {},
            ),
            gap48,
            JcButton(
              style: StyleButton.primary,
              label: 'Validar DNI',
              onPressed: () {
                widget.onChangedCode(dniController.text);
                dniController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
