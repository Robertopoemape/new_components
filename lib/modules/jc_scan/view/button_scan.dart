import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jc_module/core/core.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';

class ButtonScan extends StatefulWidget {
  const ButtonScan({
    required this.label,
    this.textStyle,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.width = double.infinity,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius,
    this.onNavigationWidget,
    this.onValueChanged,
    this.textAlign = TextAlign.center,
    this.icon,
    super.key,
  });

  final Color backgroundColor;
  final String label;
  final TextStyle? textStyle;
  final double elevation;
  final double width;
  final EdgeInsets contentPadding;
  final BorderRadius? borderRadius;
  final Widget? onNavigationWidget;
  final Function(String)? onValueChanged;
  final TextAlign textAlign;
  final String? icon;

  @override
  State<ButtonScan> createState() => _ButtonScanState();
}

class _ButtonScanState extends State<ButtonScan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.contentPadding,
      width: widget.width,
      child: Material(
        elevation: widget.elevation,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => JcScan.cashless(
                onValueChanged: widget.onValueChanged,
                onNavigationWidget: widget.onNavigationWidget,
              ),
            ),
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.icon!,
                  theme: const SvgTheme(
                    currentColor: JcColors.sec600,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.label,
                  style: widget.textStyle,
                  textAlign: widget.textAlign,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
