import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class SplashLogin extends StatelessWidget {
  const SplashLogin({
    this.isControlQr = false,
    super.key,
  });

  final bool isControlQr;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: JcColors.sec800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isControlQr) ...[
            Center(
              child: Text(
                'Titulo',
                style: JcTextStyle.h4.w800.gsWhite,
              ),
            ),
          ] else ...[
            Center(
              child: Padding(
                padding: padSy16,
                child: SvgPicture.asset(
                  JcImgSvg.logo.path,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
