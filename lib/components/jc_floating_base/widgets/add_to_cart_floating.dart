import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class AddToCartFloating extends StatelessWidget {
  const AddToCartFloating({
    required this.onPressed,
    required this.onPressedMinus,
    required this.onPressedPlus,
    this.labelCount = '1',
    super.key,
  });
  final VoidCallback onPressed;
  final VoidCallback onPressedMinus;
  final VoidCallback onPressedPlus;
  final String labelCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: JcColors.gs100,
        boxShadow: [
          BoxShadow(
            color: JcColors.gs850.withOpacity(0.3),
            offset: const Offset(0, -2),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: padSy16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onPressedMinus,
                  child: const Padding(
                    padding: padSyH4,
                    child: Icon(
                      Icons.remove_circle_rounded,
                      color: JcColors.gs1000,
                      size: 28,
                    ),
                  ),
                ),
                space4,
                SizedBox(
                  width: 36,
                  child: Center(
                    child: Text(
                      labelCount,
                      style: JcTextStyle.body1,
                    ),
                  ),
                ),
                space4,
                InkWell(
                  onTap: onPressedPlus,
                  child: const Padding(
                    padding: padSyH4,
                    child: Icon(
                      Icons.add_circle_rounded,
                      color: JcColors.gs1000,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            JcButton(
              style: StyleButton.primary,
              label: 'Agregar al carrito',
              onPressed: double.parse(labelCount) > 0 ? onPressed : null,
            ),
          ],
        ),
      ),
    );
  }
}
