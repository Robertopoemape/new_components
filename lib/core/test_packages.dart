import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestPackages extends StatelessWidget {
  const TestPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        'packages/jc_config/assets/svg/logo.svg',
        width: 100,
        height: 100,
      ),
    );
  }
}
