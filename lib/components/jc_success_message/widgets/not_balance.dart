import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_success_message/widgets/widgets.dart';
import 'package:jc_module/jc_module.dart';

class NotBalance extends StatelessWidget {
  const NotBalance({
    required this.title,
    required this.userCode,
    required this.availableBalance,
    required this.totalToPay,
    required this.missingAmount,
    required this.onPressedScan,
    required this.onPressedTransaction,
    this.numberDocument,
    this.typeDocument,
    this.userName,
    super.key,
  });

  final String title;
  final String userCode;
  final String? userName;
  final String? typeDocument;
  final String? numberDocument;
  final String availableBalance;
  final String totalToPay;
  final String missingAmount;
  final VoidCallback onPressedScan;
  final VoidCallback onPressedTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: JcColors.war600,
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            HeaderSuccessMessage(
              title: title,
              color: JcColors.war600,
            ),
            if (userCode != '') ...[
              gap8,
              Text(
                'Código: $userCode',
                style: JcTextStyle.caption.act1000,
              ),
            ],
            gap8,
            if (userName != null)
              UserInfoSuccessMessage(
                name: userName!,
                typeDocument: typeDocument!,
                numberDocument: numberDocument!,
              ),
            gap8,
            ActionButtonSuccessMessage(
              text: 'Ver transacciones',
              icon: Icons.arrow_forward_ios_rounded,
              color: JcColors.war600,
              onPressed: onPressedTransaction,
            ),
            gap10,
            SumaryRowSuccessMessage(
              label: 'Saldo disponible:',
              value: '$availableBalance Ptos',
              color: JcColors.war600,
            ),
            gap8,
            SumaryRowSuccessMessage(
              label: 'Total a pagar:',
              value: '$totalToPay Ptos',
              color: JcColors.war600,
            ),
            gap8,
            SumaryRowSuccessMessage(
              label: 'Monto faltante:',
              value: '$missingAmount Ptos',
              color: JcColors.war600,
            ),
            const Spacer(),
            ActionButtonSuccessMessage(
              text: 'Escaneo',
              color: JcColors.war600,
              onPressed: onPressedScan,
            ),
          ],
        ),
      ),
    );
  }
}
