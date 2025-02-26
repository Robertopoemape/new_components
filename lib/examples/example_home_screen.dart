import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/router/router.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleHomeScreen extends StatelessWidget {
  const ExampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = [
      {
        'label': 'Detalle producto',
        'route': const ExampleDetailBuyScreenRoute(),
      },
      {
        'label': 'Menu drawer',
        'route': const ExampleMenuDrawerScreenRoute(),
      },
      {
        'label': 'Confirmación',
        'route': const ExampleConfirmPaymentPointScreenRoute(),
      },
      {'label': 'Card', 'route': const ExampleCardEventsScreenRoute()},
      {
        'label': 'Card de productos',
        'route': const ExampleBaseListSearchScreenRoute(),
      },
      {
        'label': 'Lista y busca',
        'route': const ExampleOrderHistoryScreenRoute(),
      },
      {
        'label': 'Lista, busca',
        'route': const ExampleReportRechargeDetailScreenRoute(),
      },
      {
        'label': 'Confirm popup',
        'route': const ExampleConfirmPoupScreenRoute(),
      },
      {
        'label': 'Card transfer point',
        'route': const ExampleCardTransferPointScreenRoute(),
      },
      {'label': 'Calendar', 'route': const ExampleCalendarScreenRoute()},
      {'label': 'Pdf', 'route': const ExamplePdfScreenRoute()},
      {'label': 'Dropdown', 'route': const ExampleDropdownScreenRoute()},
      {
        'label': 'Card menu seller',
        'route': const ExampleCardListScreenRoute(),
      },
      {
        'label': 'Success Message response',
        'route': const ExampleSuccessMessageScreenRoute(),
      },
    ];

    return Scaffold(
      body: Padding(
        padding: padSy16,
        child: ListView(
          children: [
            Row(
              children: [
                Center(
                  child: Title(
                    color: JcColors.sec500,
                    child: Text(
                      'Mis Componentes',
                      style: JcTextStyle.h6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(),
                Text('Componentes: ${examples.length}'),
              ],
            ),
            gap16,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3,
              ),
              itemCount: examples.length,
              itemBuilder: (context, index) {
                final example = examples[index];
                return JcButton(
                  style: StyleButton.primary,
                  label: example['label']! as String,
                  onPressed: () {
                    autoRouterPush(context, example['route']! as PageRouteInfo);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
