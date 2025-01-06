import 'package:flutter/material.dart';
import 'package:jc_module/core/core.dart';

class ButtonOption extends StatelessWidget {
  const ButtonOption({
    required this.iconData,
    required this.label,
    required this.onPressed,
    super.key,
  });
  final IconData iconData;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            Icon(
              iconData,
              color: JcColors.gs500,
            ),
            space8,
            Text(
              label,
              style: JcTextStyle.subtitle2.gsWhite.w800,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              weight: 4,
              color: JcColors.gsWhite,
            ),
          ],
        ),
      ),
    );
  }
}
