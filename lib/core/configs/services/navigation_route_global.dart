import 'package:auto_route/auto_route.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.dart';
import 'package:jc_module/core/injection.dart';

void autoRouterPopAndPushGlobal(
  PageRouteInfo screen,
) {
  slMicro<MicroAppRouter>().popAndPush(screen);
}
