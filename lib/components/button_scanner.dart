import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/router/router.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
import 'package:jc_module/core/core.dart';
import 'package:jc_module/modules/jc_scanner/jc_scanner_screen.dart';

class ButtonScanner extends StatefulWidget {
  const ButtonScanner({
    required this.label,
    required this.titleEvent,
    required this.countryEvent,
    this.textStyle,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.width = double.infinity,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius,
    this.onValueChanged,
    this.textAlign = TextAlign.center,
    this.icon = Icons.qr_code_scanner,
    this.onPressedMore,
    super.key,
  });

  final Color backgroundColor;
  final String label;
  final TextStyle? textStyle;
  final double elevation;
  final double width;
  final EdgeInsets contentPadding;
  final BorderRadius? borderRadius;
  final Function(String, ScanType)? onValueChanged;
  final TextAlign textAlign;
  final IconData icon;
  final String titleEvent;
  final String countryEvent;
  final VoidCallback? onPressedMore;

  @override
  State<ButtonScanner> createState() => _ButtonScannerState();
}

class _ButtonScannerState extends State<ButtonScanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.contentPadding,
      width: widget.width,
      child: Material(
        elevation: widget.elevation,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        child: InkWell(
          onTap: () => autoRouterPush(
            context,
            JcScannerScreenRoute(
              titleEvent: widget.titleEvent,
              countryEvent: widget.countryEvent,
              onChangedCode: (String code, ScanType type) {
                widget.onValueChanged!(code, type);
              },
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
                Icon(
                  widget.icon,
                  color: JcColors.gs1000,
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
