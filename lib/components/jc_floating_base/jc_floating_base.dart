import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_floating_base/widgets/widgets.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';

class JcFloatingBase extends StatelessWidget {
  const JcFloatingBase._({required this.child});

  factory JcFloatingBase.payment({
    required VoidCallback onPressed,
    required VoidCallback onPressedCancel,
    String labelButtonConfirm = 'Confirmar pago',
    String labelButtonCancel = 'Cancelar',
  }) {
    return JcFloatingBase._(
      child: PaymentFloating(
        onPressed: onPressed,
        onPressedCancel: onPressedCancel,
        labelButtonConfirm: labelButtonConfirm,
        labelButtonCancel: labelButtonCancel,
      ),
    );
  }

  factory JcFloatingBase.goToPayment({
    required VoidCallback onPressed,
    required String labelTotal,
    required String labelCount,
    SymbolMoney symbolMoney = SymbolMoney.sol,
  }) {
    return JcFloatingBase._(
      child: GoToPaymentFloating(
        onPressed: onPressed,
        labelTotal: labelTotal,
        labelCount: labelCount,
        symbolMoney: symbolMoney,
      ),
    );
  }

  factory JcFloatingBase.resumeGoToPayment({
    required VoidCallback onPressed,
    required VoidCallback onPressedViewResume,
    required String labelTotal,
    required String labelCount,
    SymbolMoney symbolMoney = SymbolMoney.sol,
  }) {
    return JcFloatingBase._(
      child: ResumeGoToPaymentFloating(
        onPressed: onPressed,
        labelTotal: labelTotal,
        labelCount: labelCount,
        symbolMoney: symbolMoney,
        onPressedViewResume: onPressedViewResume,
      ),
    );
  }

  factory JcFloatingBase.close({
    required VoidCallback onPressed,
    String labelButtonClose = 'Cerrar',
  }) {
    return JcFloatingBase._(
      child: CloseFloating(
        onPressed: onPressed,
        labelButtonClose: labelButtonClose,
      ),
    );
  }
  factory JcFloatingBase.recharge({
    VoidCallback? onPressed,
    String? labelButton,
  }) {
    return JcFloatingBase._(
      child: RechargePoints(
        onPressed: onPressed,
        labelButton: labelButton,
      ),
    );
  }

  factory JcFloatingBase.addToCart({
    required VoidCallback onPressed,
    required VoidCallback onPressedMinus,
    required VoidCallback onPressedPlus,
    String labelCount = '1',
  }) {
    return JcFloatingBase._(
      child: AddToCartFloating(
        onPressed: onPressed,
        onPressedMinus: onPressedMinus,
        onPressedPlus: onPressedPlus,
        labelCount: labelCount,
      ),
    );
  }
  factory JcFloatingBase.paymentFloatingH({
    required VoidCallback onPressed,
    required VoidCallback onPressedCancel,
    String labelButtonConfirm = '      Confirmar      ',
    String labelButtonCancel = '      Cancelar      ',
  }) {
    return JcFloatingBase._(
      child: PaymentFloatingH(
        onPressed: onPressed,
        onPressedCancel: onPressedCancel,
        labelButtonConfirm: labelButtonConfirm,
        labelButtonCancel: labelButtonCancel,
      ),
    );
  }
  factory JcFloatingBase.downloadReportPrimary({
    required VoidCallback onPressed,
    required double total,
    String? labelButton = 'Descargar reporte',
  }) {
    return JcFloatingBase._(
      child: DownloadReportPrimary(
        onPressed: onPressed,
        total: total,
        labelButton: labelButton,
      ),
    );
  }
  factory JcFloatingBase.downloadReportSecondary({
    required VoidCallback onPressed,
    required double total,
    String labelButton = 'Descargar reporte',
    String labelQuantity = 'Usuarios',
    String quantity = '0.00',
  }) {
    return JcFloatingBase._(
      child: DownloadReportSecondary(
        onPressed: onPressed,
        total: total,
        labelButton: labelButton,
        labelQuantity: labelQuantity,
        quantity: quantity,
      ),
    );
  }
  factory JcFloatingBase.totalFloating({
    double total = 0.0,
    String labelQuantity = 'Usuarios',
    String quantity = '0.00',
    SymbolMoney symbolMoney = SymbolMoney.sol,
  }) {
    return JcFloatingBase._(
      child: TotalFloating(
        total: total,
        labelQuantity: labelQuantity,
        quantity: quantity,
        symbolMoney: symbolMoney,
      ),
    );
  }
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
