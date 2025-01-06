import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';

@RoutePage()
class ExampleCardEventsScreen extends StatelessWidget {
  const ExampleCardEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JcCard(
            nameTitle: 'Viva Mexico 2024',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            onTapJcCard: () {},
          ),
        ],
      ),
    );
  }
}
