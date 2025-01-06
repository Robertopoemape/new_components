import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';
import 'package:jc_module/modules/jc_scanner/jc_scanner_screen.dart';

void showButtonSheetEnter({
  required BuildContext context,
  required ScanType scanType,
  required Function(String code, ScanType type) onPressed,
  required String title,
  required String hintText,
  required TextEditingController controller,
  required String labelButton,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: JcColors.gsWhite,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: padSy24.copyWith(
              top: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: JcTextStyle.h6.w900,
                ),
                gap16,
                JcInput(
                  hintText: hintText,
                  onChanged: (v) {},
                  controller: controller,
                ),
                gap16,
                JcButton(
                  label: labelButton,
                  onPressed: () => onPressed(controller.text, scanType),
                  sizeStyle: SizeStyleButton.large,
                  style: StyleButton.primary,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
