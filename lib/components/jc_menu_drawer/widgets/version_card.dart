import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jc_module/core/core.dart';

class VersionCard extends StatelessWidget {
  const VersionCard({
    required this.version,
    super.key,
  });
  final String version;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            JcImgSvg.logoPower.path,
          ),
          space8,
          Text(
            version,
            style: JcTextStyle.caption.gsWhite,
          ),
        ],
      ),
    );
  }
}
