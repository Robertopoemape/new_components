import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.dart';
import 'package:jc_module/jc_module.dart';

final appRouter = MicroAppRouter();
void main() {
  EnvironmentManager.setEnvironment(EnvironmentApp.dev);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [
          //CartObserver(),
        ],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: JcColors.sec800,
          actionsIconTheme: IconThemeData(color: JcColors.sec800),
        ),
        fontFamily: 'packages/jc_module/Poppins',
        fontFamilyFallback: const [
          'packages/jc_module/Poppins',
          'packages/jc_module/Furious',
        ],
      ),
    );
  }
}
