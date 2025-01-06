import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class HeaderSuccessMessage extends StatelessWidget {
  const HeaderSuccessMessage({
    required this.title,
    this.color = JcColors.act1000,
    this.colorText = JcColors.act1000,
    super.key,
  });
  final String title;
  final Color? color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorText,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 32,
          height: 32,
          child: Icon(
            Icons.close,
            color: color,
          ),
        ),
        space8,
        Text(
          title,
          style: JcTextStyle.h6.act1000.copyWith(color: colorText),
        ),
      ],
    );
  }
}
