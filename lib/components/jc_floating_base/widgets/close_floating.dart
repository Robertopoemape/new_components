import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class CloseFloating extends StatelessWidget {
  const CloseFloating({
    required this.onPressed,
    this.labelButtonClose = 'Cerrar',
    super.key,
  });
  final String? labelButtonClose;
  final VoidCallback onPressed;

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
      child: JcButton(
        padding: padSy16,
        style: StyleButton.outline,
        label: labelButtonClose ?? '',
        onPressed: onPressed,
      ),
    );
  }
}
