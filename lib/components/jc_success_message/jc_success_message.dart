import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_success_message/widgets/not_exits_code.dart';
import 'package:jc_module/components/jc_success_message/widgets/widgets.dart';

class JcSuccessMessage extends StatelessWidget {
  const JcSuccessMessage._({
    required this.child,
  });

  factory JcSuccessMessage.notBalance({
    required String title,
    required String userCode,
    required String availableBalance,
    required String missingAmount,
    required String totalToPay,
    required VoidCallback onPressedScan,
    required VoidCallback onPressedTransaction,
    String? userName,
    String? typeDocument,
    String? numberDocument,
  }) {
    return JcSuccessMessage._(
      child: NotBalance(
        title: title,
        userCode: userCode,
        userName: userName,
        typeDocument: typeDocument,
        numberDocument: numberDocument,
        availableBalance: availableBalance,
        missingAmount: missingAmount,
        totalToPay: totalToPay,
        onPressedScan: onPressedScan,
        onPressedTransaction: onPressedTransaction,
      ),
    );
  }

  factory JcSuccessMessage.notExistCode({
    required String title,
    required String userCode,
    required String message,
    required VoidCallback onPressedScan,
  }) {
    return JcSuccessMessage._(
      child: NotExistsCode(
        title: title,
        userCode: userCode,
        message: message,
        onPressedScan: onPressedScan,
      ),
    );
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
