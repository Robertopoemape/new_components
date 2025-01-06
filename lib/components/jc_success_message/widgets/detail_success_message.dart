import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class DetailSuccessMessage extends StatelessWidget {
  const DetailSuccessMessage({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: JcTextStyle.caption.act1000),
        Text(value, style: JcTextStyle.caption.act1000),
      ],
    );
  }
}
