import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jc_module/core/configs/services/secure_storage_service.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class CredentialLoginScreen extends ConsumerStatefulWidget {
  const CredentialLoginScreen({
    this.isControlQr = false,
    super.key,
  });
  final bool isControlQr;

  @override
  ConsumerState<CredentialLoginScreen> createState() =>
      _CredentialLoginScreenState();
}

class _CredentialLoginScreenState extends ConsumerState<CredentialLoginScreen> {
  final AuthenticationRemoteRepository _authServices =
      AuthenticationRemoteRepositoryImpl();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      final authOrFailure = await _authServices.login(
        _usernameController.text,
        _passwordController.text,
      );
      await authOrFailure.fold(
        (failure) => showDialogMessagePopup(
          context,
          message: failure.message.toString(),
        ),
        (userInfo) async {
          await SecureStorageService().deleteUserInfo();
          await SecureStorageService().saveUserInfo(userInfo);
          if (!mounted) return;
          await context.router.replaceNamed('/home-route');
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                color: JcColors.bgcblack,
              ),
            ),
          ),
          Positioned(
            top: 36,
            left: 0,
            child: SizedBox(
              height: size.height * 0.26,
              width: size.width,
              child: Image.asset(
                JcImg.bgLogin.path,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!widget.isControlQr) ...[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'QR Cashless',
                      style: JcTextStyle.h4.w800.gsWhite,
                    ),
                  ),
                ] else ...[
                  SvgPicture.asset(
                    JcImgSvg.titleSecondary.path,
                    width: 200,
                  ),
                  SvgPicture.asset(
                    JcImgSvg.titleSecondary.path,
                    width: 200,
                  ),
                  SvgPicture.asset(
                    JcImgSvg.titleSecondary.path,
                    width: 200,
                  ),
                  SvgPicture.asset(
                    JcImgSvg.titlePrimary.path,
                    width: 200,
                  ),
                  gap12,
                ],
                Text(
                  'Uso exclusivo para \norganizadores',
                  style: JcTextStyle.body1.w800.gsWhite.copyWith(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 48,
            left: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: padSy14,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: JcColors.bgcblack.withOpacity(0.6),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: JcColors.gsWhite,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: padSy16.copyWith(
                top: 48,
                bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Inicia sesión aquí',
                      style: JcTextStyle.body2.w900.gsWhite,
                    ),
                  ),
                  gap16,
                  JcInput(
                    controller: _usernameController,
                    hintText: 'Usuario',
                    label: 'Usuario',
                    colorInputText: JcColors.gsWhite,
                    colorHinText: JcColors.gs700,
                    onChanged: (value) {},
                    iconInsideInput: Icons.check_circle,
                    styleSizeInput: StyleSizeInput.large,
                  ),
                  gap8,
                  JcInput(
                    controller: _passwordController,
                    hintText: 'Contraseña',
                    label: 'Contraseña',
                    isPassword: true,
                    colorInputText: JcColors.gsWhite,
                    colorHinText: JcColors.gs700,
                    styleSizeInput: StyleSizeInput.large,
                    onChanged: (value) {},
                  ),
                  gap16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 1,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: JcColors.gsWhite,
                            ),
                          ),
                        ),
                        child: Text(
                          '¿Has olvidado tu contraseña?',
                          style: JcTextStyle.overline.w500.gsWhite,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 1,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: JcColors.gsWhite,
                            ),
                          ),
                        ),
                        child: Text(
                          '¿No tienes una cuenta?',
                          style: JcTextStyle.overline.w500.gsWhite,
                        ),
                      ),
                    ],
                  ),
                  gap24,
                  JcButton(
                    label: 'Ingresar',
                    onPressed: _login,
                    sizeStyle: SizeStyleButton.large,
                    style: StyleButton.primary,
                  ),
                  const Spacer(),
                  Center(
                    child: SvgPicture.asset(
                      JcImgSvg.logoPower.path,
                    ),
                  ),
                  gap12,
                  Center(
                    child: Text(
                      'Versión 2.0',
                      style: JcTextStyle.body2.w500.gs700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
