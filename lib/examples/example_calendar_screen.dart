import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleCalendarScreen extends StatefulWidget {
  const ExampleCalendarScreen({super.key});

  @override
  State<ExampleCalendarScreen> createState() => _ExampleCalendarScreenState();
}

class _ExampleCalendarScreenState extends State<ExampleCalendarScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JcColors.gsWhite,
      appBar: AppBar(
        backgroundColor: JcColors.gsWhite,
        title: Text(
          'Selecciona fecha y hora',
          style: JcTextStyle.subtitle2,
        ),
        actions: [
          JcCardOnline(
            name: 'Online',
            color: JcColors.pri1000,
            onPressed: () {},
            backgroundColor: JcColors.pri1000,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              JcCalendar(
                controller: searchController,
                selectedDate: (value) {
                  log(value.toString());
                },
              ),
              JcHour(
                title: 'Hora inicio',
                selectedTime: (value) {
                  log(value.toString());
                },
              ),
              gap24,
              JcHour(
                title: 'Hora fin',
                selectedTime: (value) {
                  log(value.toString());
                },
                isEndOfDay: true,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.paymentFloatingH(
              onPressed: () {},
              onPressedCancel: () {},
            ),
          ),
        ],
      ),
    );
  }
}
