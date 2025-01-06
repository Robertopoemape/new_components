import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ErrorScan extends StatelessWidget {
  const ErrorScan(this.message, {super.key});
  final String message;
  @override
  Widget build(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: JcColors.acce600,
            ),
            child: Center(
              child: Text(message, style: JcTextStyle.body1),
            ),
          ),
        ),
      );
}
