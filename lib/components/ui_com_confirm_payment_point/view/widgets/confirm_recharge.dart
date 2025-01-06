import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ConfirmRecharge extends StatelessWidget {
  const ConfirmRecharge({
    this.title,
    this.totalAmountPoints,
    this.points,
    this.paymentMethod,
    this.destination,
    this.contentPadding = EdgeInsets.zero,
    super.key,
  });
  final String? title;
  final double? totalAmountPoints;
  final double? points;
  final String? paymentMethod;
  final String? destination;
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
            title ?? '¡Recarga exitosa!',
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
                'Monto total: ',
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
                'Método de pago: ',
                style: JcTextStyle.caption.gs900,
              ),
              Text(
                '$paymentMethod',
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
                'Destino: ',
                style: JcTextStyle.caption.gs900,
              ),
              Text(
                '$destination',
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
