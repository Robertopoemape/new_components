/*import 'package:flutter/material.dart';
import 'package:ui_com_colors/ui_com_colors.dart';
import 'package:ui_com_style_text/style/jc_text_style.dart';

void showMessageConfirmationDiscount({
  required BuildContext context,
  required List<ItemMerchandises> itemMerchandisesWaiting,
  required VoidCallback onPressed,
  required String title,
  required String message,
}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.92,
          color: JcColors.gsWhite,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  style: JcTextStyle.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                child: Text(
                  'RESUMEN',
                  style: JcTextStyle.body1,
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                  itemCount: itemMerchandisesWaiting.length,
                  itemBuilder: (BuildContext context, int i) => Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            child: Text((i + 1).toString()),
                          ),
                          Text(itemMerchandisesWaiting[i].name!),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(
                          'CONFIRMAR PAGO',
                          style: JcTextStyle.body1.gsWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(JcColors.act600),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'CANCELAR',
                          style: JcTextStyle.body1.gsWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

void showMessageConfirmationDiscountProcessed({
  required BuildContext context,
  required List<ItemMerchandises> itemMerchandisesWaiting,
  required String message,
}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.9,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Compra finalizada correctamente.'),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                child: Text(
                  'RESUMEN',
                  style: JcTextStyle.body2.w500,
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                  itemCount: itemMerchandisesWaiting.length,
                  itemBuilder: (BuildContext context, int i) => Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            child: Text((i + 1).toString()),
                          ),
                          Text(itemMerchandisesWaiting[i].name!),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(JcColors.act600),
                    ),
                    onPressed: () {},
                    /*Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.routeBase,
                      (Route<dynamic> route) => false,
                    ),*/
                    child: Text(
                      'CANCELAR',
                      style: JcTextStyle.body2.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
*/
