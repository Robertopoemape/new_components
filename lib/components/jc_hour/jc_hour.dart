import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jc_module/jc_module.dart';

class JcHour extends StatefulWidget {
  const JcHour({
    required this.title,
    required this.selectedTime,
    this.isEndOfDay = false,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: jcs100),
    super.key,
  });

  final String title;
  final EdgeInsets contentPadding;
  final ValueChanged<String> selectedTime;
  final bool isEndOfDay;

  @override
  JcHourState createState() => JcHourState();
}

class JcHourState extends State<JcHour> {
  late TextEditingController _hourController;
  late TextEditingController _minuteController;

  @override
  void initState() {
    super.initState();

    if (widget.isEndOfDay) {
      _hourController = TextEditingController(text: '23');
      _minuteController = TextEditingController(text: '59');
    } else {
      _hourController = TextEditingController(text: '00');
      _minuteController = TextEditingController(text: '00');
    }
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  String get selectedTimeOfDay {
    final hour = int.tryParse(_hourController.text) ?? 0;
    final minute = int.tryParse(_minuteController.text) ?? 0;

    final now = DateTime.now();
    final selectedTime = DateTime(now.year, now.month, now.day, hour, minute);

    return DateFormat('HH:mm:ss').format(selectedTime);
  }

  void _updateSelectedTime() {
    if (mounted) {
      widget.selectedTime(selectedTimeOfDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: JcTextStyle.subtitle1,
          ),
          gap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHourInput(_hourController),
              space20,
              Text(
                ':',
                style: JcTextStyle.h5.sec900,
              ),
              space20,
              _buildMinuteInput(_minuteController),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHourInput(TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: JcTextStyle.body2.sec400,
        textAlign: TextAlign.center,
        maxLength: 2,
        onChanged: (value) {
          final intValue = int.tryParse(value) ?? 0;
          if (intValue < 0 || intValue > 23) {
            controller.text = intValue.clamp(0, 23).toString().padLeft(2, '0');
          }
          _updateSelectedTime();
        },
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) {
          return null;
        },
      ),
    );
  }

  Widget _buildMinuteInput(TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: JcColors.gs700, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: JcTextStyle.body2.sec400,
        textAlign: TextAlign.center,
        maxLength: 2,
        onChanged: (value) {
          final intValue = int.tryParse(value) ?? 0;
          if (intValue < 0 || intValue > 59) {
            controller.text = intValue.clamp(0, 59).toString().padLeft(2, '0');
          }
          _updateSelectedTime();
        },
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) {
          return null;
        },
      ),
    );
  }
}
