import 'package:flutter/material.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';

enum FlowScan {
  cashless,
  other,
}

class JcScan extends StatefulWidget {
  const JcScan._({
    this.width,
    this.flowScan = FlowScan.other,
    this.onValueChanged,
    this.onNavigationWidget,
  });

  factory JcScan.cashless({
    double? width,
    FlowScan? flowScan = FlowScan.cashless,
    Widget? onNavigationWidget,
    Function(String)? onValueChanged,
  }) =>
      JcScan._(
        width: width,
        flowScan: flowScan,
        onNavigationWidget: onNavigationWidget,
        onValueChanged: onValueChanged,
      );

  factory JcScan.other({
    double? width,
    FlowScan? flowScan = FlowScan.other,
  }) =>
      JcScan._(
        width: width,
        flowScan: flowScan,
      );

  final double? width;
  final FlowScan? flowScan;
  final Widget? onNavigationWidget;
  final Function(String)? onValueChanged;

  @override
  JcScanState createState() => JcScanState();
}

class JcScanState extends State<JcScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrScan(
        onValueChanged: widget.onValueChanged,
        onNavigationWidget: widget.onNavigationWidget,
      ),
    );
  }
}
