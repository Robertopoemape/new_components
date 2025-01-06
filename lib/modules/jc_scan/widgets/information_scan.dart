import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class InformationScan extends StatelessWidget {
  const InformationScan({
    required this.color,
    required this.scanCode,
    this.message,
    this.nameTicket,
    this.user,
    this.dni,
    this.dateEntry,
    this.onPressed,
    this.isViewButton = false,
    super.key,
  });
  final Color color;
  final String scanCode;
  final String? message;
  final String? nameTicket;
  final String? user;
  final String? dni;
  final String? dateEntry;
  final VoidCallback? onPressed;
  final bool? isViewButton;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        height: 380,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color,
                ),
                child: Center(
                  child: Text(
                    color == JcColors.acce600 ? 'X' : '✓',
                    style: JcTextStyle.body1.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              scanCode,
                              style: JcTextStyle.body1.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (message != null)
                Text(
                  message!,
                  style: JcTextStyle.body1.w700.copyWith(
                    color: color,
                  ),
                ),
              if (nameTicket != null)
                Text(
                  'Evento: $nameTicket',
                  style: JcTextStyle.body1.w700.copyWith(
                    color: color,
                  ),
                ),
              if (user != null)
                Text(
                  'Usuario: $user',
                  style: JcTextStyle.body1.w700.gsWhite,
                ),
              if (dni != null)
                Text(
                  'DNI: $dni',
                  style: JcTextStyle.body1.w700.gsWhite,
                ),
              if (dateEntry != null && dateEntry != '')
                Text(
                  'Fecha: $dateEntry',
                  style: JcTextStyle.body1.w700.gsWhite,
                ),
              if (isViewButton!)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JcColors.gsWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Continuar',
                      style: JcTextStyle.body1.w700,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
