import 'package:flutter/material.dart';
import 'package:jc_module/components/ui_com_confirm_payment_point/view/widgets/confirm_discount.dart';
import 'package:jc_module/components/ui_com_confirm_payment_point/view/widgets/confirm_recharge.dart';
import 'package:jc_module/components/ui_com_confirm_payment_point/view/widgets/confirm_successful_purchase.dart';
import 'package:jc_module/components/ui_com_confirm_payment_point/view/widgets/confirm_successful_transfer.dart';

class JcConfirmPaymentPoint extends StatelessWidget {
  const JcConfirmPaymentPoint._({
    required this.child,
  });

  factory JcConfirmPaymentPoint.primary({
    required List<Product> listProduct,
    required double pointsDescount,
    String? title,
    double? points = 0,
  }) {
    return JcConfirmPaymentPoint._(
      child: ConfirmDiscount(
        title: title,
        listProduct: listProduct,
        pointsDescount: pointsDescount,
        points: points,
      ),
    );
  }

  factory JcConfirmPaymentPoint.secondary({
    required List<Product> listProduct,
    required double pointsDescount,
    String? title,
    double? points = 0,
  }) {
    return JcConfirmPaymentPoint._(
      child: ConfirmSuccessfulPurchase(
        title: title,
        listProduct: listProduct,
        pointsDescount: pointsDescount,
        points: points,
      ),
    );
  }

  factory JcConfirmPaymentPoint.tertiary({
    required double totalAmountPoints,
    required double points,
    String? title,
    String? fromCode,
    String? toCode,
    EdgeInsets? contentPadding,
  }) {
    return JcConfirmPaymentPoint._(
      child: ConfirmSuccessfulTransfer(
        title: title,
        totalAmountPoints: totalAmountPoints,
        points: points,
        fromCode: fromCode,
        toCode: toCode,
        contentPadding: contentPadding,
      ),
    );
  }

  factory JcConfirmPaymentPoint.quaternary({
    required double totalAmountPoints,
    required double points,
    String? title,
    String? paymentMethod,
    String? destination,
    EdgeInsets? contentPadding,
  }) {
    return JcConfirmPaymentPoint._(
      child: ConfirmRecharge(
        title: title,
        totalAmountPoints: totalAmountPoints,
        points: points,
        paymentMethod: paymentMethod,
        destination: destination,
        contentPadding: contentPadding,
      ),
    );
  }
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class Product {
  Product({
    required this.nameProduct,
    required this.quantity,
  });
  final String nameProduct;
  final int quantity;
}
