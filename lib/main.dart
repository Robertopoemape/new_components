import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
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

@RoutePage()
class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padSy16,
        child: ListView(
          children: [
            gap20,
            Title(
              color: Colors.black,
              child: Text(
                'Mis Componentes',
                style: JcTextStyle.h6,
                textAlign: TextAlign.center,
              ),
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Example detail buy',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleDetailBuyScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Example Go To Payment',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleGoToPaymentScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Example Payment',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExamplePaymentScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Example Close',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleCloseScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Example Menu drawer',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleMenuDrawerScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Confirmation payment point',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleConfirmPaymentPointScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Card events',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleCardEventsScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Card Products',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleCardProductsScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Historial de pedidos',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleOrderHistoryScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Reporte detalle de recargas',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleReportRechargeDetailScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Confirm popup',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleConfirmPoupScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Card transfer point',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleCardTransferPointScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Calendar',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleCalendarScreenRoute(),
                );
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Pdf',
              onPressed: () {
                autoRouterPush(context, const ExamplePdfScreenRoute());
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Dropdown',
              onPressed: () {
                autoRouterPush(context, const ExampleDropdownScreenRoute());
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Card menu seller',
              onPressed: () {
                autoRouterPush(context, const ExampleCardListScreenRoute());
              },
            ),
            gap16,
            JcButton(
              style: StyleButton.primary,
              label: 'Success Message response',
              onPressed: () {
                autoRouterPush(
                  context,
                  const ExampleSuccessMessageScreenRoute(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
