import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

const double horizontalPadding = 8;
const double checkboxPadding = 2;
const double borderWidth = 1;
const double checkboxSize = 16;
const double innerBorderRadius = 4;
const double iconSize = 13;
const double errorIconSize = 20;
const double errorRowTopPadding = 8;

class JcCheckbox extends StatelessWidget {
  const JcCheckbox({
    required this.error,
    required this.nameCheckbox,
    required this.initialColor,
    required this.labelError,
    this.borderRadius = 8,
    this.contentPadding = const EdgeInsets.all(16),
    super.key,
  });

  final bool error;
  final EdgeInsets contentPadding;
  final String nameCheckbox;
  final String labelError;
  final bool initialColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: Column(
        children: [
          Row(
            children: [
              _buildCheckbox(),
              const SizedBox(width: horizontalPadding),
              Text(
                nameCheckbox,
                style: JcTextStyle.body1.sec600,
              ),
            ],
          ),
          if (error) _buildErrorRow(),
        ],
      ),
    );
  }

  Widget _buildCheckbox() {
    final isChecked = !initialColor;
    final borderColor = _getBorderColor();
    final fillColor = _getFillColor();

    return Container(
      padding: const EdgeInsets.all(checkboxPadding),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        height: checkboxSize,
        width: checkboxSize,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(innerBorderRadius),
        ),
        child: isChecked
            ? const Icon(
                Icons.check_outlined,
                color: JcColors.gsWhite,
                size: iconSize,
              )
            : null,
      ),
    );
  }

  Widget _buildErrorRow() {
    return Padding(
      padding: const EdgeInsets.only(top: errorRowTopPadding),
      child: Row(
        children: [
          const Icon(
            Icons.info,
            color: JcColors.err600,
            size: errorIconSize,
          ),
          const SizedBox(width: horizontalPadding),
          Text(
            labelError,
            style: JcTextStyle.caption.err600,
          ),
        ],
      ),
    );
  }

  Color _getBorderColor() {
    if (initialColor) {
      return JcColors.sec200;
    }
    return error ? Colors.transparent : JcColors.pri700;
  }

  Color _getFillColor() {
    if (initialColor) {
      return Colors.transparent;
    }
    return error ? JcColors.err600 : JcColors.pri700;
  }
}
