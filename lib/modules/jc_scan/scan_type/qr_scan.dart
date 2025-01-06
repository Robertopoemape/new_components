import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:jc_module/core/core.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';

enum FlowQr {
  camera,
  honeymell,
  zebra,
}

class QrScan extends StatefulWidget {
  const QrScan({
    this.onValueChanged,
    this.onNavigationWidget,
    super.key,
  });

  final Function(String)? onValueChanged;
  final Widget? onNavigationWidget;

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  var flowQr = FlowQr.camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildQrBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayColor: JcColors.pri600,
        overlayOpacity: 0.1,
        backgroundColor: JcColors.pri600,
        childrenButtonSize: const Size(200, 56),
        children: <SpeedDialChild>[
          SpeedDialChild(
            backgroundColor: JcColors.gs200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.blur_linear,
                    color: JcColors.sec600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Scan QR',
                    style: JcTextStyle.body1.sec600,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                flowQr = FlowQr.camera;
              });
            },
          ),
          SpeedDialChild(
            backgroundColor: JcColors.gs200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.blur_linear,
                    color: JcColors.sec600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Lector infrarojo',
                    style: JcTextStyle.body1.sec600,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                flowQr = FlowQr.honeymell;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildQrBody() {
    switch (flowQr) {
      case FlowQr.camera:
        return QrCamera(
          onValueChanged: widget.onValueChanged!,
          onNavigationWidget: widget.onNavigationWidget!,
        );
      case FlowQr.honeymell:
        return QrHoneywell(
          onValueChanged: widget.onValueChanged!,
          onNavigationWidget: widget.onNavigationWidget!,
        );

      case FlowQr.zebra:
        return const SizedBox.shrink();
      default:
        break;
    }
    return const SizedBox.shrink();
  }
}
