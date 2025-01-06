import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ConfirmSuccessfulTransfer extends StatelessWidget {
  const ConfirmSuccessfulTransfer({
    this.title,
    this.totalAmountPoints,
    this.points,
    this.fromCode,
    this.toCode,
    this.contentPadding = EdgeInsets.zero,
    super.key,
  });
  final String? title;
  final double? totalAmountPoints;
  final double? points;
  final String? fromCode;
  final String? toCode;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: contentPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? '¡Transferencia exitosa!',
            style: JcTextStyle.caption.gs900,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              space40,
              Text(
                points!.toStringAsFixed(2),
                style: JcTextStyle.h2.sec900,
              ),
              space8,
              Text(
                'Ptos.',
                style: JcTextStyle.tinyCaption.sec900,
              ),
            ],
          ),
          gap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Monto total destino: ',
                style: JcTextStyle.caption.gs900,
              ),
              Text(
                '${totalAmountPoints!.toStringAsFixed(2)} ptos',
                style: JcTextStyle.subtitle2.sec900,
              ),
            ],
          ),
          const Divider(
            height: jcs20,
            color: JcColors.gs600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Desde: ',
                style: JcTextStyle.caption.gs900,
              ),
              Text(
                '$fromCode',
                style: JcTextStyle.caption.sec900,
              ),
            ],
          ),
          const Divider(
            height: jcs28,
            color: JcColors.gs600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enviado a: ',
                style: JcTextStyle.caption.gs900,
              ),
              Text(
                '$toCode',
                style: JcTextStyle.caption.sec900,
              ),
            ],
          ),
          const Divider(
            height: jcs28,
            color: JcColors.gs600,
          ),
        ],
      ),
    );
  }
}
