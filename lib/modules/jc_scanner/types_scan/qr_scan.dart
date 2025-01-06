import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScan extends StatefulWidget {
  const QrScan({required this.onChangedCode, super.key});
  final Function(String) onChangedCode;

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  Barcode? result;
  QRViewController? controller;
  bool flashOn = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 4, child: _buildQrView(context)),
      ],
    );
  }

  Future<void> onToggleFlash() async {
    await controller!.toggleFlash();
    flashOn = !flashOn;
    setState(() {});
  }

  Widget _buildQrView(BuildContext context) {
    final scanArea = (MediaQuery.of(context).size.width < 360 ||
            MediaQuery.of(context).size.height < 360)
        ? 250.0
        : 280.0;
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: JcColors.gsWhite,
            overlayColor: const Color.fromRGBO(0, 0, 0, 60),
            borderRadius: 16,
            borderWidth: 12,
            borderLength: 150,
            cutOutSize: scanArea,
          ),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: JcButton(
            prefixIcon:
                flashOn ? Icons.flash_off_rounded : Icons.flash_on_rounded,
            style: StyleButton.primary,
            sizeStyle: SizeStyleButton.small,
            onPressed: () {
              onToggleFlash();
            },
            label: 'Flash',
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
        widget.onChangedCode(result!.code ?? '');
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
