import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class DownloadReportPrimary extends StatelessWidget {
  const DownloadReportPrimary({
    required this.onPressed,
    this.labelButton = 'Cerrar',
    this.total = 0,
    this.symbolMoney = SymbolMoney.point,
    super.key,
  });
  final String? labelButton;
  final VoidCallback onPressed;
  final double? total;
  final SymbolMoney symbolMoney;

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          JcButton(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 24),
            style: StyleButton.outline,
            label: labelButton ?? '',
            onPressed: onPressed,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: JcTextStyle.caption.sec900,
              ),
              Text(
                '${symbolMoney.symbol} ${total!.toStringAsFixed(2)}',
                style: JcTextStyle.subtitle1.sec900,
              ),
              gap12,
            ],
          ),
          space14,
        ],
      ),
    );
  }
}
