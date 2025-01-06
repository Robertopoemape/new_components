import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class UserInfoSuccessMessage extends StatelessWidget {
  const UserInfoSuccessMessage({
    required this.typeDocument,
    required this.numberDocument,
    this.name = '',
    super.key,
  });

  final String name;
  final String typeDocument;
  final String numberDocument;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: JcTextStyle.subtitle2.act1000,
        ),
        Text(
          '$typeDocument $numberDocument',
          style: JcTextStyle.h5.act1000.copyWith(letterSpacing: 4),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
