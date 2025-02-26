import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/core/core.dart';

class JcCardTransferPoint extends StatelessWidget {
  const JcCardTransferPoint({
    required this.title,
    this.code = '',
    this.points = '',
    this.onPressedCamera,
    this.symbolMoney = SymbolMoney.sol,
    super.key,
  });
  final String title;
  final String code;
  final String points;
  final VoidCallback? onPressedCamera;
  final SymbolMoney? symbolMoney;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: JcTextStyle.subtitle1.sec600,
        ),
        gap8,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: JcColors.gs600),
            color: JcColors.gs100,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (code.isNotEmpty) ...[
                Text(
                  'Cód: $code',
                  style: JcTextStyle.caption.gs900,
                ),
                const Spacer(),
                Text(
                  points,
                  style: JcTextStyle.subtitle1.sec900,
                ),
                space4,
                Text(
                  ' ${symbolMoney!.symbol}',
                  style: JcTextStyle.caption.gs700.w600,
                ),
                space16,
              ] else ...[
                Text(
                  'Presione para escanear',
                  style: JcTextStyle.caption.gs900,
                ),
                space32,
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                ),
                const Spacer(),
              ],
              InkWell(
                onTap: onPressedCamera ?? () {},
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: JcColors.sec600,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: JcColors.gsWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
