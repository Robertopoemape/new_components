import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class ConfirmDiscount extends StatelessWidget {
  const ConfirmDiscount({
    required this.title,
    required this.listProduct,
    required this.pointsDescount,
    this.points = 0,
    super.key,
  });
  final List<Product> listProduct;
  final double pointsDescount;
  final String? title;
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
            title ?? 'Se te descontarán',
            style: JcTextStyle.subtitle1.sec900,
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
