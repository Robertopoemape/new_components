import 'package:flutter/material.dart';
import 'package:jc_module/core/core.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCamera extends StatefulWidget {
  const QrCamera({
    required this.onValueChanged,
    required this.onNavigationWidget,
    this.width,
    super.key,
  });

  final double? width;
  final Function(String) onValueChanged;
  final Widget onNavigationWidget;

  @override
  State<QrCamera> createState() => _QrCameraState();
}

class _QrCameraState extends State<QrCamera> {
  late QrCameraScan qrCameraScan;

  @override
  void initState() {
    super.initState();
    qrCameraScan = QrCameraScan();
  }

  @override
  void dispose() {
    qrCameraScan.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: (controller) {
            qrCameraScan.setController(controller);
            controller.scannedDataStream.listen((scanData) {
              qrCameraScan.onScanResult(
                context,
                scanData.code,
                widget.onValueChanged,
                widget.onNavigationWidget,
              );
            });
          },
          overlay: QrScannerOverlayShape(
            borderColor: JcColors.pri600,
            overlayColor: JcColors.bgcamera,
            borderLength: jcs50,
            borderWidth: jcs10,
            cutOutBottomOffset: jcs100,
            cutOutSize: (MediaQuery.of(context).size.width < jcs400 ||
                    MediaQuery.of(context).size.height < jcs400)
                ? jcs220
                : jcs200,
          ),
          onPermissionSet: (QRViewController ctrl, bool p) =>
              qrCameraScan.onPermissionSet(context, ctrl, p),
        ),
        Positioned(
          right: 0,
          bottom: jcs15,
          child: IconButton(
            icon: qrCameraScan.iconFlash,
            onPressed: qrCameraScan.toggleFlash,
          ),
        ),
      ],
    );
  }
}
