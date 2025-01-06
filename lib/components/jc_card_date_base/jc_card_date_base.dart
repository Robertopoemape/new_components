import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_card_date_base/widgets/jc_card_date_primary.dart';
import 'package:jc_module/components/jc_card_date_base/widgets/jc_card_date_secondary.dart';
import 'package:jc_module/core/configs/common/app_padding.dart';

class JcCardDateBase extends StatelessWidget {
  const JcCardDateBase._({
    required this.child,
  });

  factory JcCardDateBase.primary({
    required String date,
    required String hour,
    VoidCallback? onPressedCalendar,
    EdgeInsets contentPadding = padSy16,
  }) {
    return JcCardDateBase._(
      child: JcCardDatePrimary(
        date: date,
        hour: hour,
        onPressedCalendar: onPressedCalendar,
        contentPadding: contentPadding,
      ),
    );
  }
  factory JcCardDateBase.secondary({
    required String date,
    required String hour,
    VoidCallback? onPressedDeleteFilter,
    VoidCallback? onPressedCalendar,
    EdgeInsets contentPadding = const EdgeInsets.only(
      top: 8,
      bottom: 8,
      right: 28,
      left: 16,
    ),
  }) {
    return JcCardDateBase._(
      child: JcCardDateSecondary(
        date: date,
        hour: hour,
        onPressedDeleteFilter: onPressedDeleteFilter,
        onPressedCalendar: onPressedCalendar,
        contentPadding: contentPadding,
      ),
    );
  }
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
