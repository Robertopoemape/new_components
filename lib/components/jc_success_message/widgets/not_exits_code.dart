import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_success_message/widgets/action_button_success_message.dart';
import 'package:jc_module/jc_module.dart';

class NotExistsCode extends StatelessWidget {
  const NotExistsCode({
    required this.title,
    required this.userCode,
    required this.message,
    required this.onPressedScan,
    super.key,
  });

  final String title;
  final String userCode;
  final String message;
  final VoidCallback onPressedScan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: JcColors.act600,
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              Icons.error_outlined,
              color: JcColors.act1000,
              size: 50,
            ),
            gap8,
            Text(
              title,
              style: JcTextStyle.h5.act1000,
            ),
            gap60,
            Text(
              'Código: $userCode',
              style: JcTextStyle.h6.act1000,
            ),
            gap16,
            Text(
              message,
              style: JcTextStyle.caption.acce1000,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ActionButtonSuccessMessage(
              text: 'Escaneo',
              color: JcColors.act600,
              onPressed: onPressedScan,
            ),
          ],
        ),
      ),
    );
  }
}
