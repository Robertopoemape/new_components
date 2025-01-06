import 'package:flutter/material.dart';
import 'package:jc_module/core/core.dart';

class JcCardDateSecondary extends StatelessWidget {
  const JcCardDateSecondary({
    required this.date,
    required this.hour,
    required this.onPressedDeleteFilter,
    required this.onPressedCalendar,
    required this.contentPadding,
    super.key,
  });

  final String date;
  final String hour;
  final VoidCallback? onPressedDeleteFilter;
  final VoidCallback? onPressedCalendar;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: JcColors.gs300,
      child: Padding(
        padding: contentPadding,
        child: Row(
          children: [
            if (date.isNotEmpty) ...[
              IconButton(
                onPressed: onPressedDeleteFilter,
                icon: const Icon(
                  Icons.delete_outline,
                  color: JcColors.sec600,
                ),
              ),
              space8,
              Column(
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
                    ],
                  ),
                ],
              ),
            ] else
              Text(
                'Filtrar por fecha y hora',
                style: JcTextStyle.subtitle2.sec900,
              ),
            const Spacer(),
            InkWell(
              onTap: onPressedCalendar,
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
