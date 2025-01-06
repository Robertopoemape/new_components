part of 'router_provider_micro.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class MicroAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const CustomRouteType(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthenticationScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleHomeScreenRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ExampleAuthenticationScreenRoute.page,
        ),
        AutoRoute(
          page: CredentialLoginScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCardEventsScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCardProductsScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCloseScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleConfirmPaymentPointScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleDetailBuyScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleGoToPaymentScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleMenuDrawerScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleOrderHistoryScreenRoute.page,
        ),
        AutoRoute(
          page: ExamplePaymentScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleGoToPaymentScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCardTransferPointScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleSuccessMessageScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCalendarScreenRoute.page,
        ),
        AutoRoute(
          page: ExamplePdfScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleDropdownScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleConfirmPoupScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleCardListScreenRoute.page,
        ),
        AutoRoute(
          page: ExampleReportRechargeDetailScreenRoute.page,
        ),
      ];
}
