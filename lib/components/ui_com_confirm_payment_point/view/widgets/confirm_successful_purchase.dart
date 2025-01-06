import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ConfirmSuccessfulPurchase extends StatelessWidget {
  const ConfirmSuccessfulPurchase({
    required this.listProduct,
    required this.pointsDescount,
    this.title,
    this.points,
    super.key,
  });
  final String? title;
  final List<Product> listProduct;
  final double pointsDescount;
  final double? points;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gap16,
          Text(
            title ?? 'Compra exitosa',
            style: JcTextStyle.subtitle1.sec900,
          ),
          Text(
            'Se descontaron ${pointsDescount.toStringAsFixed(2)} pts',
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
          Text(
            'Saldo',
            style: JcTextStyle.body2.sec900,
          ),
          const Divider(
            height: jcs36,
            color: JcColors.gs600,
          ),
          gap16,
          Text(
            'Resumen de la compra',
            style: JcTextStyle.subtitle1.sec900,
          ),
          gap16,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: s24),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: listProduct.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          space24,
                          SizedBox(
                            width: jcs45,
                            child: Text(
                              listProduct[index].quantity.toString(),
                              style: JcTextStyle.h5.sec900,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          space24,
                          Expanded(
                            child: Text(
                              listProduct[index].nameProduct,
                              style: JcTextStyle.body1.sec900,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: JcColors.gs600,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          gap108,
        ],
      ),
    );
  }
}
