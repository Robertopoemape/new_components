import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jc_module/jc_module.dart';

class JcCalendar extends StatefulWidget {
  const JcCalendar({
    required this.controller,
    required this.selectedDate,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<List<String>> selectedDate;

  @override
  State<JcCalendar> createState() => _JcCalendarState();
}

class _JcCalendarState extends State<JcCalendar> {
  List<String> _dates = [
    DateFormat('yyyy-MM-dd').format(DateTime.now()),
    DateFormat('yyyy-MM-dd').format(DateTime.now()),
  ];

  bool multiDate = true;
  bool _userHasSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        JcButton(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          onPressed: () {
            setState(() {
              multiDate = !multiDate;
              if (!multiDate && _dates.isNotEmpty) {
                _dates = [];
                _userHasSelected = true;
              }
            });
          },
          style: StyleButton.primary,
          label: multiDate
              ? 'Cambiar a selección Única'
              : 'Cambiar a selección Múltiple',
        ),
        Flexible(
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              dayMaxWidth: 30,
              daySplashColor: JcColors.pri600,
              dayTextStyle: JcTextStyle.body1,
              yearTextStyle: JcTextStyle.body1,
              monthTextStyle: JcTextStyle.body1,
              selectedRangeHighlightColor: JcColors.pri200,
              selectedDayTextStyle: _userHasSelected
                  ? JcTextStyle.body1.gsWhite
                  : JcTextStyle.body1.pri700,
              selectedDayHighlightColor:
                  _userHasSelected ? JcColors.pri700 : JcColors.gsWhite,
              calendarViewMode: CalendarDatePicker2Mode.day,
              calendarType: multiDate
                  ? CalendarDatePicker2Type.range
                  : CalendarDatePicker2Type.single,
            ),
            value: _dates.map(DateTime.parse).toList(),
            onValueChanged: (dates) {
              setState(() {
                _dates = dates
                    .map((date) => DateFormat('yyyy-MM-dd').format(date))
                    .toList();
                widget.selectedDate(_dates);
                _userHasSelected = true;
              });
            },
          ),
        ),
      ],
    );
  }
}
