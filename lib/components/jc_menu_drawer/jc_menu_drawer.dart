import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_menu_drawer/widgets/widgets.dart';
import 'package:jc_module/jc_module.dart';

class JcMenuDrawer extends StatelessWidget {
  const JcMenuDrawer({
    required this.optionsMenu,
    this.onPressed,
    super.key,
  });
  final List<OptionMenu> optionsMenu;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: JcColors.succ500,
      child: SafeArea(
        child: Padding(
          padding: padSy16.copyWith(
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderDrawer(),
              Expanded(
                flex: 3,
                child: Column(
                  children: optionsMenu.map((optionMenu) {
                    return ButtonOptionMenu(
                      menuOption: optionMenu,
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              ButtonOption(
                iconData: Icons.logout,
                label: 'Cerrar sesión',
                onPressed: onPressed!,
              ),
              gap8,
              const VersionCard(version: 'Versión 1.0'),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionMenu {
  OptionMenu({
    this.iconData,
    this.label,
    this.subOptionMenu,
  });
  IconData? iconData;
  String? label;
  List<SubOptionMenu>? subOptionMenu;
}

class SubOptionMenu {
  SubOptionMenu({
    required this.onPressed,
    required this.label,
  });
  String label;
  VoidCallback onPressed;
}
