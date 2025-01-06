import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class DeletedProduct extends StatelessWidget {
  const DeletedProduct({required this.deletedProduct, super.key});
  final VoidCallback deletedProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: deletedProduct,
      child: Container(
        margin: const EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: JcColors.succ100,
          border: Border(
            left: BorderSide(
              width: 4,
              color: JcColors.succ600,
            ),
            right: BorderSide(
              color: JcColors.succ600,
            ),
            top: BorderSide(
              color: JcColors.succ600,
            ),
            bottom: BorderSide(
              color: JcColors.succ600,
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: JcColors.succ600,
              size: 20,
            ),
            space8,
            Text(
              'Venta eliminada correctamente',
              style: JcTextStyle.caption.succ800,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}
