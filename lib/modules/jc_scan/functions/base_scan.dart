import 'package:flutter/material.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCameraScan extends FunctionScan {
  QrCameraScan({
    this.controller,
  });
  @override
  QRViewController? controller;

  void setController(QRViewController controller) {
    this.controller = controller;
    updateIconFlash();
  }

  void onScanResult(
    BuildContext context,
    String? scanCode,
    Function(String) onValueChanged,
    Widget onNavigationWidget,
  ) {
    if (scanCode != null && scanCode.isNotEmpty) {
      onValueChanged(scanCode);
      controller?.pauseCamera();
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => onNavigationWidget,
        ),
      );
    }
  }
}

class QrHoneywellScan extends FunctionScan {
  QrHoneywellScan({
    this.controller,
  });
  @override
  HoneywellScanner? controller;
}
/*
class QrZebra extends FunctionScan {
  @override
  final ZebraController? controller;

  QrZebra({this.controller});

  // Aquí puedes agregar cualquier lógica específica para QrZebra
}*/
