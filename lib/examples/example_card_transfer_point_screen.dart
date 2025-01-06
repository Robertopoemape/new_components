import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';
import 'package:jc_module/core/core.dart';

@RoutePage()
class ExampleCardTransferPointScreen extends StatefulWidget {
  const ExampleCardTransferPointScreen({super.key});

  @override
  State<ExampleCardTransferPointScreen> createState() =>
      _ExampleCardTransferPointScreenState();
}

class _ExampleCardTransferPointScreenState
    extends State<ExampleCardTransferPointScreen> {
  String code = '';
  String points = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Transferencia de puntos',
          style: JcTextStyle.subtitle2,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                JcCardTransferPoint(
                  title: 'Desde',
                  code: code,
                  points: points,
                  onPressedCamera: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        code = 'C989GX3';
                        points = '305';
                      });
                    });
                  },
                ),
                gap8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Invertir',
                      style: JcTextStyle.caption.gs600,
                    ),
                    space8,
                    const Icon(
                      Icons.swap_vert_outlined,
                      color: JcColors.gs600,
                    ),
                  ],
                ),
                gap8,
                const JcCardTransferPoint(
                  title: 'Enviar a',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.recharge(
              labelButton: 'Confirmar',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 5), () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
