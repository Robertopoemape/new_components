import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    this.alias = 'Alias',
    this.rol = 'Rol de usuario',
    this.isOnline = true,
    super.key,
  });
  final String? alias;
  final String? rol;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alias!,
              style: JcTextStyle.body1.gsWhite.w700,
            ),
            Text(
              rol!,
              style: JcTextStyle.tinyCaption.gs800,
            ),
          ],
        ),
        const Spacer(),
        if (isOnline!) ...[
          JcCardOnline(
            backgroundColor: Colors.transparent,
            name: 'Online',
            color: JcColors.succ600,
            onPressed: () {},
          ),
        ] else
          JcCardOnline(
            backgroundColor: Colors.transparent,
            name: 'Offline',
            color: JcColors.succ600,
            onPressed: () {},
          ),
      ],
    );
  }
}
