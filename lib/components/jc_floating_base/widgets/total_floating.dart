import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class TotalFloating extends StatelessWidget {
  const TotalFloating({
    required this.total,
    required this.symbolMoney,
    required this.labelQuantity,
    required this.quantity,
    super.key,
  });

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
            gap8,
          ],
        ),
      ),
    );
  }
}
