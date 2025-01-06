import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class DownloadReportSecondary extends StatelessWidget {
  const DownloadReportSecondary({
    required this.onPressed,
    this.labelButton = '',
    this.total = 0.0,
    this.symbolMoney = SymbolMoney.sol,
    this.labelQuantity = '',
    this.quantity = '',
    super.key,
  });

  final String labelButton;
  final VoidCallback onPressed;
  final double total;
  final SymbolMoney symbolMoney;
  final String labelQuantity;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final hasTotal = total > 0;
    final hasQuantity = quantity.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (hasQuantity)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        labelQuantity,
                        style: JcTextStyle.caption.sec900,
                      ),
                      Text(
                        quantity,
                        style: JcTextStyle.subtitle1.sec900,
                      ),
                    ],
                  ),
                const Spacer(),
                if (hasTotal)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: JcTextStyle.caption.sec900,
                      ),
                      Text(
                        '${symbolMoney.symbol} $total',
                        style: JcTextStyle.subtitle1.sec900,
                      ),
                    ],
                  ),
              ],
            ),
            gap16,
            JcButton(
              style: StyleButton.outline,
              label: labelButton,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
