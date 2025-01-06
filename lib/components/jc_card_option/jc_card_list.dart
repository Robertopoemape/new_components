import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class JcCardOption extends StatelessWidget {
  const JcCardOption({
    required this.titleName,
    required this.onPressed,
    this.backgroundColor = JcColors.gs100,
    this.colorBorder = JcColors.gs600,
    this.icon,
    super.key,
  });

  final String titleName;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color colorBorder;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(jcs16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: colorBorder,
            width: jcs07,
          ),
        ),
        child: Row(
          children: [
            icon ?? const SizedBox(width: 24, height: 24),
            space8,
            Expanded(
              child: Text(
                titleName,
                style: JcTextStyle.subtitle1.w700.sec900,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
