import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class GoToPaymentFloating extends StatelessWidget {
  const GoToPaymentFloating({
    required this.onPressed,
    required this.labelTotal,
    required this.labelCount,
    this.symbolMoney = SymbolMoney.sol,
    this.labelButton = 'Ir a cobrar',
    super.key,
  });
  final VoidCallback onPressed;
  final String labelCount;
  final String labelTotal;
  final SymbolMoney symbolMoney;
  final String labelButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: JcColors.gs100,
        boxShadow: [
          BoxShadow(
            color: JcColors.gs850.withOpacity(0.3),
            offset: const Offset(0, -2),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: padSy16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total ($labelCount)',
                  style: JcTextStyle.tinyCaption,
                ),
                Text(
                  '$labelTotal ${symbolMoney.symbol} ',
                  style: JcTextStyle.subtitle1.sec900,
                ),
              ],
            ),
            JcButton(
              style: StyleButton.primary,
              label: labelButton,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
