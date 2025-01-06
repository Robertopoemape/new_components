import 'package:flutter/material.dart';
import 'package:jc_module/core/core.dart';

class JcCardDatePrimary extends StatelessWidget {
  const JcCardDatePrimary({
    required this.date,
    required this.hour,
    required this.onPressedCalendar,
    required this.contentPadding,
    super.key,
  });

  final String date;
  final String hour;
  final VoidCallback? onPressedCalendar;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedCalendar,
      child: Padding(
        padding: contentPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: JcTextStyle.subtitle1.sec900,
                    ),
                    Text(
                      hour,
                      style: JcTextStyle.caption.sec900,
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: JcColors.gs700, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: JcColors.sec600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
