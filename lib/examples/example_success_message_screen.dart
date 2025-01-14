import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_success_message/jc_success_message.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleSuccessMessageScreen extends StatelessWidget {
  const ExampleSuccessMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JcColors.gsWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JcButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            style: StyleButton.primary,
            label: 'Sin saldo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Scaffold(
                    body: JcSuccessMessage.notBalance(
                      title: 'Sin saldo suficiente',
                      userCode: 'dasdsasa',
                      availableBalance: '100',
                      missingAmount: '15',
                      totalToPay: '15',
                      onPressedTransaction: () {},
                      onPressedScan: () {
                        showDialogMessageTransfer(
                          context,
                          onPressedCancel: () {},
                          onPressedConfirm: () {},
                          points: '',
                          userCode: '',
                          userCodeTo: '',
                          orderNumber: '',
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          gap16,
          JcButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            style: StyleButton.primary,
            label: 'Codigo no existe',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Scaffold(
                    body: JcSuccessMessage.notExistCode(
                      title: 'Código no existe',
                      userCode: 'J8xo0ze8',
                      onPressedScan: () {
                        showDialogMessageTransfer(
                          context,
                          onPressedCancel: () {
                            Navigator.pop(context);
                          },
                          onPressedConfirm: () {},
                          points: '',
                          userCode: '',
                          userCodeTo: '',
                          orderNumber: '',
                        );
                      },
                      message: 'El código escaneado no '
                          'existe y no fue emitido por la plataforma',
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
