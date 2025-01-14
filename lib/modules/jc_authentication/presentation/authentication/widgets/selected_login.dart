import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
import 'package:jc_module/jc_module.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedLogin extends StatelessWidget {
  const SelectedLogin({
    this.isControlQr = false,
    super.key,
  });

  final bool isControlQr;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
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
              if (!isControlQr) ...[
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
              ],
              gap12,
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
                Text(
                  'Modo de ingreso al app',
                  style: JcTextStyle.body2.w500.gs800,
                ),
                gap16,
                InkWell(
                  onTap: () {
                    autoRouterPush(
                      context,
                      CredentialLoginScreenRoute(),
                    );
                  },
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          JcImgSvg.userPass.path,
                          height: 24,
                          width: 24,
                        ),
                        space8,
                        Text(
                          'Usuario y contraseña',
                          style: JcTextStyle.body2.w800.gsWhite,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: JcColors.gsWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 8,
                  color: JcColors.gs900,
                  thickness: 0.5,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          JcImgSvg.qrCamera.path,
                          height: 24,
                          width: 24,
                          color: JcColors.gs1000,
                        ),
                        space8,
                        Text(
                          'Ingresar con código QR',
                          style: JcTextStyle.body2.w800.gs1000,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: JcColors.gs1000,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Próximamente',
                            style: JcTextStyle.overline.w800.gs800.gs800,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: JcColors.gs1000,
                        ),
                      ],
                    ),
                  ),
                ),
                gap32,
                Text(
                  'Quieres comprar entradas',
                  style: JcTextStyle.body2.w500.gs800,
                ),
                InkWell(
                  onTap: () => launchUrl(
                    Uri(
                      scheme: 'https',
                      host: 'https://robertopoemape.github.io/home.html',
                    ),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          JcImgSvg.goEvent.path,
                          height: 24,
                          width: 24,
                        ),
                        space8,
                        Text(
                          'Ir a ver eventos',
                          style: JcTextStyle.body2.w800.gsWhite,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: JcColors.gsWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: SvgPicture.asset(
                    JcImgSvg.logo.path,
                  ),
                ),
                gap12,
                Center(
                  child: Text(
                    'Versión 1.0',
                    style: JcTextStyle.body2.w500.gs700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
