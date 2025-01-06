import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/style/app_colors.dart';
import 'package:jc_module/modules/jc_authentication/presentation/authentication/authentication.dart';

@RoutePage()
class ExampleAuthenticationScreen extends StatelessWidget {
  const ExampleAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: JcColors.bgcblack,
      body: AuthenticationScreen(),
    );
  }
}
