import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class SumaryRowSuccessMessage extends StatelessWidget {
  const SumaryRowSuccessMessage({
    required this.label,
    required this.value,
    required this.color,
    super.key,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: JcTextStyle.body1.act1000,
        ),
        const Spacer(),
        Text(
          value,
          style: JcTextStyle.h6.act1000,
        ),
        space8,
        Container(
          decoration: BoxDecoration(
            color: JcColors.act1000,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 18,
          height: 18,
          child: Icon(
            Icons.close,
            color: color,
            size: 15,
          ),
        ),
      ],
    );
  }
}
