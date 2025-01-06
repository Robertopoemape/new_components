import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/secure_storage_service.dart';
import 'package:jc_module/modules/jc_authentication/presentation/authentication/widgets/widgets.dart';

enum StatusLogin {
  splash,
  selected,
  preLogin,
}

@RoutePage()
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    this.isControlQr = false,
    super.key,
  });

  final bool isControlQr;
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  StatusLogin _statusLogin = StatusLogin.splash;
  Future<void> validatedTokenSession() async {
    final isSessionValid = await SecureStorageService().isSessionValid();
    if (!mounted) return;
    if (isSessionValid) {
      await context.router.replaceNamed('/home-route');
    } else {
      await Future.delayed(const Duration(seconds: 2), () {
        _statusLogin = StatusLogin.preLogin;
        setState(() {});
      });
      await Future.delayed(const Duration(seconds: 2), () {
        _statusLogin = StatusLogin.selected;
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    validatedTokenSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    switch (_statusLogin) {
      case StatusLogin.splash:
        return SplashLogin(
          isControlQr: widget.isControlQr,
        );
      case StatusLogin.preLogin:
        return PreLogin(
          isControlQr: widget.isControlQr,
        );
      case StatusLogin.selected:
        return SelectedLogin(
          isControlQr: widget.isControlQr,
        );
      default:
        return const SizedBox();
    }
  }
}
