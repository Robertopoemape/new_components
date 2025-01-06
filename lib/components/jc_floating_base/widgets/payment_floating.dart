import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class PaymentFloating extends StatelessWidget {
  const PaymentFloating({
    required this.onPressed,
    required this.onPressedCancel,
    this.labelButtonConfirm = 'Confirmar pago',
    this.labelButtonCancel = 'Cancelar',
    super.key,
  });
  final String? labelButtonConfirm;
  final String? labelButtonCancel;
  final VoidCallback onPressed;
  final VoidCallback onPressedCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: JcColors.gs100,
        boxShadow: [
          BoxShadow(
            color: JcColors.gs850.withOpacity(0.3),
            offset: const Offset(0, -2),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: padSy16,
        child: Column(
          children: [
            JcButton(
              style: StyleButton.primary,
              label: labelButtonConfirm ?? '',
              onPressed: onPressed,
            ),
            gap10,
            JcButton(
              style: StyleButton.textPrimary,
              label: labelButtonCancel ?? '',
              onPressed: onPressedCancel,
            ),
          ],
        ),
      ),
    );
  }
}
