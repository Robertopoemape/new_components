// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;
import 'package:jc_module/examples/example_authentication_screen.dart' as _i3;
import 'package:jc_module/examples/example_calendar_screen.dart' as _i4;
import 'package:jc_module/examples/example_card_events_screen.dart' as _i5;
import 'package:jc_module/examples/example_card_option_screen.dart' as _i6;
import 'package:jc_module/examples/example_card_products_screen.dart' as _i7;
import 'package:jc_module/examples/example_card_transfer_point_screen.dart'
    as _i8;
import 'package:jc_module/examples/example_close_screen.dart' as _i9;
import 'package:jc_module/examples/example_confirm_payment_point_screen.dart'
    as _i10;
import 'package:jc_module/examples/example_confirm_poup_screen.dart' as _i11;
import 'package:jc_module/examples/example_detail_buy_screen.dart' as _i12;
import 'package:jc_module/examples/example_dropdown_screen.dart' as _i13;
import 'package:jc_module/examples/example_go_to_payment_screen.dart' as _i14;
import 'package:jc_module/examples/example_menu_drawer_screen.dart' as _i16;
import 'package:jc_module/examples/example_order_history_screen.dart' as _i17;
import 'package:jc_module/examples/example_payment_screen.dart' as _i18;
import 'package:jc_module/examples/example_pdf_screen.dart' as _i19;
import 'package:jc_module/examples/example_report_recharge_detail_screen.dart'
    as _i20;
import 'package:jc_module/examples/example_resumen_go_to_payment_screen.dart'
    as _i22;
import 'package:jc_module/examples/example_scanner/example_scanner_screen.dart'
    as _i23;
import 'package:jc_module/examples/example_scanner/view/example_result_message_screen.dart'
    as _i21;
import 'package:jc_module/examples/example_success_message_screen.dart' as _i24;
import 'package:jc_module/main.dart' as _i15;
import 'package:jc_module/modules/jc_authentication/presentation/authentication/screen/authentication_screen.dart'
    as _i1;
import 'package:jc_module/modules/jc_authentication/presentation/credential_login/screen/credential_login_screen.dart'
    as _i2;
import 'package:jc_module/modules/jc_scanner/jc_scanner_screen.dart' as _i25;

/// generated route for
/// [_i1.AuthenticationScreen]
class AuthenticationScreenRoute
    extends _i26.PageRouteInfo<AuthenticationScreenRouteArgs> {
  AuthenticationScreenRoute({
    bool isControlQr = false,
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          AuthenticationScreenRoute.name,
          args: AuthenticationScreenRouteArgs(
            isControlQr: isControlQr,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthenticationScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthenticationScreenRouteArgs>(
          orElse: () => const AuthenticationScreenRouteArgs());
      return _i1.AuthenticationScreen(
        isControlQr: args.isControlQr,
        key: args.key,
      );
    },
  );
}

class AuthenticationScreenRouteArgs {
  const AuthenticationScreenRouteArgs({
    this.isControlQr = false,
    this.key,
  });

  final bool isControlQr;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AuthenticationScreenRouteArgs{isControlQr: $isControlQr, key: $key}';
  }
}

/// generated route for
/// [_i2.CredentialLoginScreen]
class CredentialLoginScreenRoute
    extends _i26.PageRouteInfo<CredentialLoginScreenRouteArgs> {
  CredentialLoginScreenRoute({
    bool isControlQr = false,
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          CredentialLoginScreenRoute.name,
          args: CredentialLoginScreenRouteArgs(
            isControlQr: isControlQr,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CredentialLoginScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CredentialLoginScreenRouteArgs>(
          orElse: () => const CredentialLoginScreenRouteArgs());
      return _i2.CredentialLoginScreen(
        isControlQr: args.isControlQr,
        key: args.key,
      );
    },
  );
}

class CredentialLoginScreenRouteArgs {
  const CredentialLoginScreenRouteArgs({
    this.isControlQr = false,
    this.key,
  });

  final bool isControlQr;

  final _i27.Key? key;

  @override
  String toString() {
    return 'CredentialLoginScreenRouteArgs{isControlQr: $isControlQr, key: $key}';
  }
}

/// generated route for
/// [_i3.ExampleAuthenticationScreen]
class ExampleAuthenticationScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleAuthenticationScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleAuthenticationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleAuthenticationScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i3.ExampleAuthenticationScreen();
    },
  );
}

/// generated route for
/// [_i4.ExampleCalendarScreen]
class ExampleCalendarScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCalendarScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCalendarScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCalendarScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i4.ExampleCalendarScreen();
    },
  );
}

/// generated route for
/// [_i5.ExampleCardEventsScreen]
class ExampleCardEventsScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCardEventsScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCardEventsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCardEventsScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i5.ExampleCardEventsScreen();
    },
  );
}

/// generated route for
/// [_i6.ExampleCardListScreen]
class ExampleCardListScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCardListScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCardListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCardListScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i6.ExampleCardListScreen();
    },
  );
}

/// generated route for
/// [_i7.ExampleCardProductsScreen]
class ExampleCardProductsScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCardProductsScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCardProductsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCardProductsScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i7.ExampleCardProductsScreen();
    },
  );
}

/// generated route for
/// [_i8.ExampleCardTransferPointScreen]
class ExampleCardTransferPointScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCardTransferPointScreenRoute(
      {List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCardTransferPointScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCardTransferPointScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i8.ExampleCardTransferPointScreen();
    },
  );
}

/// generated route for
/// [_i9.ExampleCloseScreen]
class ExampleCloseScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleCloseScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleCloseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleCloseScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i9.ExampleCloseScreen();
    },
  );
}

/// generated route for
/// [_i10.ExampleConfirmPaymentPointScreen]
class ExampleConfirmPaymentPointScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleConfirmPaymentPointScreenRoute(
      {List<_i26.PageRouteInfo>? children})
      : super(
          ExampleConfirmPaymentPointScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleConfirmPaymentPointScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i10.ExampleConfirmPaymentPointScreen();
    },
  );
}

/// generated route for
/// [_i11.ExampleConfirmPoupScreen]
class ExampleConfirmPoupScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleConfirmPoupScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleConfirmPoupScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleConfirmPoupScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i11.ExampleConfirmPoupScreen();
    },
  );
}

/// generated route for
/// [_i12.ExampleDetailBuyScreen]
class ExampleDetailBuyScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleDetailBuyScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleDetailBuyScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleDetailBuyScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i12.ExampleDetailBuyScreen();
    },
  );
}

/// generated route for
/// [_i13.ExampleDropdownScreen]
class ExampleDropdownScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleDropdownScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleDropdownScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleDropdownScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i13.ExampleDropdownScreen();
    },
  );
}

/// generated route for
/// [_i14.ExampleGoToPaymentScreen]
class ExampleGoToPaymentScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleGoToPaymentScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleGoToPaymentScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleGoToPaymentScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i14.ExampleGoToPaymentScreen();
    },
  );
}

/// generated route for
/// [_i15.ExampleHomeScreen]
class ExampleHomeScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleHomeScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleHomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleHomeScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i15.ExampleHomeScreen();
    },
  );
}

/// generated route for
/// [_i16.ExampleMenuDrawerScreen]
class ExampleMenuDrawerScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleMenuDrawerScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleMenuDrawerScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleMenuDrawerScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i16.ExampleMenuDrawerScreen();
    },
  );
}

/// generated route for
/// [_i17.ExampleOrderHistoryScreen]
class ExampleOrderHistoryScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleOrderHistoryScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleOrderHistoryScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleOrderHistoryScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i17.ExampleOrderHistoryScreen();
    },
  );
}

/// generated route for
/// [_i18.ExamplePaymentScreen]
class ExamplePaymentScreenRoute extends _i26.PageRouteInfo<void> {
  const ExamplePaymentScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExamplePaymentScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePaymentScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i18.ExamplePaymentScreen();
    },
  );
}

/// generated route for
/// [_i19.ExamplePdfScreen]
class ExamplePdfScreenRoute extends _i26.PageRouteInfo<void> {
  const ExamplePdfScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExamplePdfScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePdfScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i19.ExamplePdfScreen();
    },
  );
}

/// generated route for
/// [_i20.ExampleReportRechargeDetailScreen]
class ExampleReportRechargeDetailScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleReportRechargeDetailScreenRoute(
      {List<_i26.PageRouteInfo>? children})
      : super(
          ExampleReportRechargeDetailScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleReportRechargeDetailScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i20.ExampleReportRechargeDetailScreen();
    },
  );
}

/// generated route for
/// [_i21.ExampleResultMessageScreen]
class ExampleResultMessageScreenRoute
    extends _i26.PageRouteInfo<ExampleResultMessageScreenRouteArgs> {
  ExampleResultMessageScreenRoute({
    required String code,
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ExampleResultMessageScreenRoute.name,
          args: ExampleResultMessageScreenRouteArgs(
            code: code,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ExampleResultMessageScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExampleResultMessageScreenRouteArgs>();
      return _i21.ExampleResultMessageScreen(
        code: args.code,
        key: args.key,
      );
    },
  );
}

class ExampleResultMessageScreenRouteArgs {
  const ExampleResultMessageScreenRouteArgs({
    required this.code,
    this.key,
  });

  final String code;

  final _i27.Key? key;

  @override
  String toString() {
    return 'ExampleResultMessageScreenRouteArgs{code: $code, key: $key}';
  }
}

/// generated route for
/// [_i22.ExampleResumenGoToPaymentScreen]
class ExampleResumenGoToPaymentScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleResumenGoToPaymentScreenRoute(
      {List<_i26.PageRouteInfo>? children})
      : super(
          ExampleResumenGoToPaymentScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleResumenGoToPaymentScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i22.ExampleResumenGoToPaymentScreen();
    },
  );
}

/// generated route for
/// [_i23.ExampleScannerScreen]
class ExampleScannerScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleScannerScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleScannerScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleScannerScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i23.ExampleScannerScreen();
    },
  );
}

/// generated route for
/// [_i24.ExampleSuccessMessageScreen]
class ExampleSuccessMessageScreenRoute extends _i26.PageRouteInfo<void> {
  const ExampleSuccessMessageScreenRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ExampleSuccessMessageScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleSuccessMessageScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i24.ExampleSuccessMessageScreen();
    },
  );
}

/// generated route for
/// [_i25.JcScannerScreen]
class JcScannerScreenRoute
    extends _i26.PageRouteInfo<JcScannerScreenRouteArgs> {
  JcScannerScreenRoute({
    required dynamic Function(
      String,
      _i25.ScanType,
    ) onChangedCode,
    String? titleEvent = 'Futuro Incierto 25 años',
    String? countryEvent = 'Lima',
    bool? isShowConfig = true,
    _i27.VoidCallback? onToggleOnline,
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          JcScannerScreenRoute.name,
          args: JcScannerScreenRouteArgs(
            onChangedCode: onChangedCode,
            titleEvent: titleEvent,
            countryEvent: countryEvent,
            isShowConfig: isShowConfig,
            onToggleOnline: onToggleOnline,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JcScannerScreenRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JcScannerScreenRouteArgs>();
      return _i25.JcScannerScreen(
        onChangedCode: args.onChangedCode,
        titleEvent: args.titleEvent,
        countryEvent: args.countryEvent,
        isShowConfig: args.isShowConfig,
        onToggleOnline: args.onToggleOnline,
        key: args.key,
      );
    },
  );
}

class JcScannerScreenRouteArgs {
  const JcScannerScreenRouteArgs({
    required this.onChangedCode,
    this.titleEvent = 'Futuro Incierto 25 años',
    this.countryEvent = 'Lima',
    this.isShowConfig = true,
    this.onToggleOnline,
    this.key,
  });

  final dynamic Function(
    String,
    _i25.ScanType,
  ) onChangedCode;

  final String? titleEvent;

  final String? countryEvent;

  final bool? isShowConfig;

  final _i27.VoidCallback? onToggleOnline;

  final _i27.Key? key;

  @override
  String toString() {
    return 'JcScannerScreenRouteArgs{onChangedCode: $onChangedCode, titleEvent: $titleEvent, countryEvent: $countryEvent, isShowConfig: $isShowConfig, onToggleOnline: $onToggleOnline, key: $key}';
  }
}