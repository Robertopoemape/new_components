import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

Future<void> showDialogMessageWithButtonPopup(
  BuildContext context, {
  required String title,
  required String message,
  required String labelButton,
  required VoidCallback onPressed,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            IntrinsicHeight(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 230,
                  minWidth: 280,
                ),
                child: Container(
                  padding: padSy24,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: JcTextStyle.body1.w700.gs1000),
                      gap16,
                      Text(message, style: JcTextStyle.caption.gs1000),
                      const Spacer(),
                      JcButton(
                        style: StyleButton.primary,
                        label: labelButton,
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  height: 32,
                  width: 32,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 24,
                    child: Icon(Icons.close, size: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> showDialogMessagePopup(
  BuildContext context, {
  required String message,
  String title = 'Información',
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            IntrinsicHeight(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 120,
                  minWidth: 280,
                ),
                child: Container(
                  padding: padSy24,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: JcTextStyle.body1.w700.gs1000),
                      gap16,
                      Text(message, style: JcTextStyle.caption.gs1000),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -18,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  height: 32,
                  width: 32,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 24,
                    child: Icon(Icons.close, size: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> showDialogMessagePopupDelete(
  BuildContext context, {
  required String message,
  required VoidCallback onPressedCancel,
  required VoidCallback onPressedConfirm,
  required String points,
  required String userCode,
  String nameTitle = 'Confirmar eliminar pedido',
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          decoration: const BoxDecoration(
            color: JcColors.gsWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nameTitle,
                style: JcTextStyle.subtitle1,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: JcTextStyle.caption.gs900,
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Monto a devolver',
                  style: JcTextStyle.caption.gs900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    points,
                    style: JcTextStyle.h2.sec900,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Ptos.',
                    style: JcTextStyle.caption.w600.gs900,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Devolución a: ',
                    style: JcTextStyle.caption.gs900,
                  ),
                  Text(
                    userCode,
                    style: JcTextStyle.caption.sec900,
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: JcColors.gs600,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JcButton(
                    style: StyleButton.outline,
                    label: 'Cancelar',
                    onPressed: onPressedCancel,
                  ),
                  const SizedBox(width: 8),
                  JcButton(
                    style: StyleButton.primary,
                    label: 'Confirmar',
                    onPressed: onPressedConfirm,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showDialogMessageTransfer(
  BuildContext context, {
  required VoidCallback onPressedCancel,
  required VoidCallback onPressedConfirm,
  required String points,
  required String userCode,
  required String userCodeTo,
  String? orderNumber,
  String nameTitle = 'Confirmar transferencia',
  String message = 'Revisar detalladamente el '
      'monto que vas a transferir antes de confirmar.',
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          decoration: const BoxDecoration(
            color: JcColors.gsWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nameTitle,
                style: JcTextStyle.subtitle1,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: JcTextStyle.caption.gs900,
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Monto a transferir',
                  style: JcTextStyle.caption.gs900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    points,
                    style: JcTextStyle.h2.sec900,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Ptos.',
                    style: JcTextStyle.caption.w600.gs900,
                  ),
                ],
              ),
              const Divider(
                height: 10,
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
                    userCode,
                    style: JcTextStyle.caption.sec900,
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: JcColors.gs600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enviar a: ',
                    style: JcTextStyle.caption.gs900,
                  ),
                  Text(
                    userCodeTo,
                    style: JcTextStyle.caption.sec900,
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: JcColors.gs600,
              ),
              if (orderNumber != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'N° de operación: ',
                      style: JcTextStyle.caption.gs900,
                    ),
                    Text(
                      orderNumber,
                      style: JcTextStyle.caption.sec900,
                    ),
                  ],
                ),
                const Divider(
                  height: 10,
                  color: JcColors.gs600,
                ),
              ],
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JcButton(
                    style: StyleButton.outline,
                    label: 'Cancelar',
                    onPressed: onPressedCancel,
                  ),
                  const SizedBox(width: 8),
                  JcButton(
                    style: StyleButton.primary,
                    label: 'Confirmar',
                    onPressed: onPressedConfirm,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showDialogMessageRecharge(
  BuildContext context, {
  required VoidCallback onPressedCancel,
  required VoidCallback onPressedConfirm,
  required String points,
  required String paymentMethod,
  required String destination,
  String nameTitle = 'Confirmar recarga',
  String message = 'Revisar detalladamente el '
      'monto que vas a recargar antes de confirmar.',
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          decoration: const BoxDecoration(
            color: JcColors.gsWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nameTitle,
                style: JcTextStyle.subtitle1,
              ),
              gap16,
              Text(
                message,
                style: JcTextStyle.caption.gs900,
              ),
              gap24,
              Center(
                child: Text(
                  'Monto a depositar',
                  style: JcTextStyle.caption.gs900,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '   $points',
                    style: JcTextStyle.h2.sec900,
                  ),
                  space8,
                  Text(
                    'Ptos.',
                    style: JcTextStyle.caption.w600.gs900,
                  ),
                ],
              ),
              gap8,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Método de pago: ',
                    style: JcTextStyle.caption.gs900,
                  ),
                  Text(
                    paymentMethod,
                    style: JcTextStyle.caption.sec900,
                  ),
                ],
              ),
              const Divider(
                height: jcs10,
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
                    destination,
                    style: JcTextStyle.caption.sec900,
                  ),
                ],
              ),
              const Divider(
                height: jcs10,
                color: JcColors.gs600,
              ),
              gap24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: JcButton(
                      style: StyleButton.outline,
                      label: 'Cancelar',
                      onPressed: onPressedCancel,
                    ),
                  ),
                  space8,
                  Expanded(
                    child: JcButton(
                      style: StyleButton.primary,
                      label: 'Confirmar',
                      onPressed: onPressedConfirm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
