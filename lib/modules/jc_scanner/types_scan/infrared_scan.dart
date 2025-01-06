import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jc_module/jc_module.dart';

class InfraredScan extends StatefulWidget {
  const InfraredScan({required this.onChangedCode, super.key});
  final Function(String) onChangedCode;
  @override
  InfraredScanState createState() => InfraredScanState();
}

class InfraredScanState extends State<InfraredScan>
    with WidgetsBindingObserver
    implements ScannerCallback {
  HoneywellScanner honeywellScanner = HoneywellScanner();
  ScannedData? scannedData;
  String? errorMessage;
  bool scannerEnabled = false;
  bool scan1DFormats = true;
  bool scan2DFormats = true;
  bool isDeviceSupported = false;

  static const MethodChannel methodChannel =
      MethodChannel('com.example.jc_module/command');
  static const EventChannel scanChannel =
      EventChannel('com.example.jc_module/scan');

  Future<void> init() async {
    updateScanProperties();
    isDeviceSupported = await honeywellScanner.isSupported();
    if (mounted) setState(() {});
    await honeywellScanner.startScanner();
  }

  void updateScanProperties() {
    final codeFormats = <CodeFormat>[];
    if (scan1DFormats) codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    if (scan2DFormats) codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);

    final properties = <String, dynamic>{
      ...CodeFormatUtils.getAsPropertiesComplement(codeFormats),
      'DEC_CODABAR_START_STOP_TRANSMIT': true,
      'DEC_EAN13_CHECK_DIGIT_TRANSMIT': true,
    };
    honeywellScanner.setProperties(properties);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner
      ..scannerCallback = this
      ..onScannerDecodeCallback = onDecoded
      ..onScannerErrorCallback = onError;
    init();
    if (!isDeviceSupported) {
      scanChannel.receiveBroadcastStream().listen(onEvent, onError: onErrors);
      createProfile('JoinnusScanBarcode');
    }
    super.initState();
  }

  Future<void> onEvent(dynamic event) async {
    final barcodeScan = jsonDecode(event.toString());
    widget.onChangedCode(barcodeScan['scanData'] as String);
  }

  Future<void> createProfile(String profileName) async {
    try {
      await methodChannel.invokeMethod('createDataWedgeProfile', profileName);
    } on PlatformException {
      debugPrint('PlatformException');
    }
  }

  void startScan() {
    _sendDataWedgeCommand(
      'com.symbol.datawedge.api.SOFT_SCAN_TRIGGER',
      'START_SCANNING',
    );
    setState(() {});
  }

  void stopScan() {
    _sendDataWedgeCommand(
      'com.symbol.datawedge.api.SOFT_SCAN_TRIGGER',
      'STOP_SCANNING',
    );
    setState(() {});
  }

  Future<void> _sendDataWedgeCommand(String command, String parameter) async {
    try {
      final argumentAsJson =
          // ignore: always_specify_types
          jsonEncode({'command': command, 'parameter': parameter});

      await methodChannel.invokeMethod(
        'sendDataWedgeCommandStringParameter',
        argumentAsJson,
      );
    } on PlatformException {
      debugPrint('PlatformException');
    }
  }

  void onErrors(Object error) {
    log(error.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Scanear código.',
      ),
    );
  }

  @override
  void onDecoded(ScannedData? scannedData) {
    setState(() {
      this.scannedData = scannedData;
      widget.onChangedCode(scannedData!.code!);
    });
  }

  @override
  void onError(Exception error) {
    setState(() {
      errorMessage = error.toString();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        honeywellScanner.resumeScanner();
      case AppLifecycleState.inactive:
        honeywellScanner.pauseScanner();
      case AppLifecycleState.paused:
        honeywellScanner.pauseScanner();
      case AppLifecycleState.detached:
        honeywellScanner.pauseScanner();
      default:
        break;
    }
  }

  @override
  void dispose() {
    honeywellScanner.stopScanner();
    super.dispose();
  }
}
