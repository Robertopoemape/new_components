import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({
    this.isControlQr = false,
    super.key,
  });

  final bool isControlQr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            JcImg.bgLogin.path,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                JcImgSvg.baseLogo.path,
                width: 200,
              ),
              gap12,
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
            gap32,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Aplicación de ',
                style: JcTextStyle.body1.w800.gsWhite,
                children: <TextSpan>[
                  TextSpan(
                    text: 'uso exclusivo \npara organizadores',
                    style: JcTextStyle.body1.w800.pri500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
