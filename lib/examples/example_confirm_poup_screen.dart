import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleConfirmPoupScreen extends StatelessWidget {
  const ExampleConfirmPoupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padSy16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JcButton(
              style: StyleButton.primary,
              label: 'Delete popup',
              onPressed: () {
                showDialogMessagePopup(
                  context,
                  message: 'Message dialog',
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Confirmar delete popup',
              onPressed: () {
                showDialogMessagePopupDelete(
                  context,
                  onPressedCancel: () {},
                  onPressedConfirm: () {},
                  points: '100',
                  message: 'El pedido de 46525918 será eliminado'
                      ' y se devolverán los puntos al usuario',
                  userCode: '[user-code]',
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Confirmar tranferencia popup',
              onPressed: () {
                showDialogMessageTransfer(
                  context,
                  onPressedCancel: () {},
                  onPressedConfirm: () {},
                  points: '100',
                  userCode: 'Efectivo',
                  userCodeTo: '[user-name or user-code]',
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Confirmar recarga popup',
              onPressed: () {
                showDialogMessageRecharge(
                  context,
                  onPressedCancel: () {},
                  onPressedConfirm: () {},
                  points: '95',
                  paymentMethod: 'Efectivo',
                  destination: '[user-name or user-code]',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
