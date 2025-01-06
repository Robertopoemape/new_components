import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ActionButtonSuccessMessage extends StatelessWidget {
  const ActionButtonSuccessMessage({
    required this.text,
    required this.onPressed,
    required this.color,
    this.colorText = JcColors.act1000,
    this.icon,
    super.key,
  });

  final String text;
  final IconData? icon;
  final Color? color;
  final Color colorText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: JcColors.act1000,
          backgroundColor: color,
          side: BorderSide(width: 2, color: colorText),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: JcTextStyle.button2.w600.copyWith(color: colorText),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  icon,
                  size: 20,
                  color: colorText,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
