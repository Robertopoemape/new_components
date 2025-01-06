import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_order/widgets/widgets.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';

class JcOrder extends StatelessWidget {
  const JcOrder({
    required this.numberDocument,
    required this.typeDocument,
    required this.date,
    required this.totalAmount,
    required this.dismissDirection,
    this.quantity = 0,
    this.userCode = '',
    this.paymentMethod = '',
    this.symbolMoney = SymbolMoney.sol,
    super.key,
  });

  final String? numberDocument;
  final String? typeDocument;
  final String date;
  final double quantity;
  final double totalAmount;
  final Function()? dismissDirection;
  final String userCode;
  final String? paymentMethod;
  final SymbolMoney? symbolMoney;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListOrder(
          numberDocument: numberDocument,
          typeDocument: typeDocument,
          date: date,
          quantity: quantity,
          totalAmount: totalAmount,
          dismissDirection: dismissDirection,
          userCode: userCode,
          paymentMethod: paymentMethod,
          symbolMoney: symbolMoney,
        ),
      ],
    );
  }
}
