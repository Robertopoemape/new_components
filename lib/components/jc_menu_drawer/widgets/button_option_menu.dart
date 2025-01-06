import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:jc_module/components/components.dart';
import 'package:jc_module/core/core.dart';

class ButtonOptionMenu extends StatefulWidget {
  const ButtonOptionMenu({
    required this.menuOption,
    super.key,
  });
  final OptionMenu menuOption;

  @override
  State<ButtonOptionMenu> createState() => _ButtonOptionMenuState();
}

class _ButtonOptionMenuState extends State<ButtonOptionMenu> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = ExpandedTileController(isExpanded: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
      controller: _controller,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.menuOption.label ?? '',
          style: JcTextStyle.subtitle2.gsWhite.w800,
        ),
      ),
      leading: Icon(
        widget.menuOption.iconData,
        color: JcColors.gs500,
      ),
      trailing: Container(
        transform: Matrix4.translationValues(0, 4, 0),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          weight: 4,
          color: JcColors.gsWhite,
        ),
      ),
      trailingRotation: 0,
      footerSeparator: 0,
      contentseparator: 0,
      theme: const ExpandedTileThemeData(
        headerColor: JcColors.bgcblack,
        headerPadding: padSyV12,
        headerSplashColor: Colors.transparent,
        footerPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        contentBackgroundColor: JcColors.bgcblack,
      ),
      content: Column(
        children: widget.menuOption.subOptionMenu
                ?.map(
                  (subOption) => SizedBox(
                    child: Row(
                      children: [
                        space24,
                        Container(
                          width: 2,
                          height: 48,
                          color: JcColors.gs500,
                        ),
                        space16,
                        Expanded(
                          child: InkWell(
                            onTap: subOption.onPressed,
                            child: SizedBox(
                              height: 48,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  subOption.label,
                                  style: JcTextStyle.body2.gs100,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
