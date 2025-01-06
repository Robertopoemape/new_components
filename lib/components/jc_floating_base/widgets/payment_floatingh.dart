import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class PaymentFloatingH extends StatelessWidget {
  const PaymentFloatingH({
    required this.onPressed,
    required this.onPressedCancel,
    this.labelButtonConfirm = '',
    this.labelButtonCancel = '',
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
        child: Row(
          children: [
            const Spacer(),
            JcButton(
              style: StyleButton.outline,
              label: labelButtonCancel ?? '',
              onPressed: onPressedCancel,
            ),
            const Spacer(),
            JcButton(
              style: StyleButton.primary,
              label: labelButtonConfirm ?? '',
              onPressed: onPressed,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
