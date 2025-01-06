import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jc_module/jc_module.dart';

enum StatusInfraredCodeScan {
  none,
  success,
  scan,
  invalid,
}

enum StatusLoading {
  loading,
  loaded,
  none,
  error,
}

class QrHoneywell extends StatefulWidget {
  const QrHoneywell({
    required this.onValueChanged,
    required this.onNavigationWidget,
    super.key,
  });

  final Function(String) onValueChanged;
  final Widget onNavigationWidget;

  @override
  State<QrHoneywell> createState() => _QrHoneywellState();
}

class _QrHoneywellState extends State<QrHoneywell>
    with WidgetsBindingObserver
    implements ScannerCallback {
  late QrHoneywellScan qrHoneywellScan;
  final TextEditingController _controller = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    qrHoneywellScan.controller?.stopScanner();
    super.dispose();
  }

  Uint8List? _capturedImage;
  Uint8List get capturedImage => _capturedImage!;
  set capturedImage(Uint8List value) {
    _capturedImage = value;
    setState(() {});
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    setState(() {});
  }

  bool isBacktrue = true;
  StatusLoading _currentStatusLoading = StatusLoading.none;
  StatusLoading get currentStatusLoading => _currentStatusLoading;
  set currentStatusLoading(StatusLoading value) {
    _currentStatusLoading = value;
    setState(() {});
    isBacktrue = true;
  }

  final String _messageCenter = 'Esperando lectura';
  String get messageCenter => _messageCenter;

  ScannedData? scannedData;

  bool _isScanned = true;
  bool get isScanned => _isScanned;
  set isScanned(bool value) {
    _isScanned = value;
    setState(() {});
  }

  static const MethodChannel methodChannel =
      MethodChannel('com.joinnus.joinnus_app_organizer/command');
  static const EventChannel scanChannel =
      EventChannel('com.joinnus.joinnus_app_organizer/scan');

  bool scannerEnabled = true;
  bool scan1DFormats = true;
  bool scan2DFormats = true;
  bool isDeviceSupported = false;

  String _barcodeString = 'Digitar código';
  String get barcodeString => _barcodeString;
  String _barcodeSymbology = '';
  String get barcodeSymbology => _barcodeSymbology;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    initializeScanner();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await qrHoneywellScan.controller?.resumeScanner();
    });

    qrHoneywellScan.controller?.scannerCallback = this;
    qrHoneywellScan.controller?.onScannerDecodeCallback = onDecoded;
    qrHoneywellScan.controller?.onScannerErrorCallback = onError;

    if (!isDeviceSupported) {
      scanChannel.receiveBroadcastStream().listen(onEvent, onError: onErrors);
      createProfile('JoinnusScanBarcode');
    }
  }

  Future<void> initializeScanner() async {
    qrHoneywellScan = QrHoneywellScan();
    await init();
  }

  Future<void> init() async {
    updateScanProperties();
    isDeviceSupported =
        await qrHoneywellScan.controller?.isSupported() ?? false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void onDecoded(ScannedData? scannedData) {
    if (isScanned) {
      setState(() {
        this.scannedData = scannedData;
        _isScanned = false;
      });
    }
  }

  void updateScanProperties() {
    final codeFormats = <CodeFormat>[
      ...CodeFormatUtils.ALL_1D_FORMATS,
      ...CodeFormatUtils.ALL_2D_FORMATS,
    ];

    final properties = <String, dynamic>{
      ...CodeFormatUtils.getAsPropertiesComplement(codeFormats),
      'DEC_CODABAR_START_STOP_TRANSMIT': true,
      'DEC_EAN13_CHECK_DIGIT_TRANSMIT': true,
    };
    qrHoneywellScan.controller?.setProperties(properties);
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

  Future<void> onEvent(dynamic event) async {
    final barcodeScan = jsonDecode(event.toString());

    _barcodeString = barcodeScan['scanData'].toString();

    setState(() {});
  }

  Future<void> createProfile(String profileName) async {
    try {
      await methodChannel.invokeMethod('createDataWedgeProfile', profileName);
    } on PlatformException {
      debugPrint('PlatformException');
    }
  }

  Future<void> _sendDataWedgeCommand(String command, String parameter) async {
    try {
      final argumentAsJson =
          jsonEncode({'command': command, 'parameter': parameter});

      await methodChannel.invokeMethod(
        'sendDataWedgeCommandStringParameter',
        argumentAsJson,
      );
    } on PlatformException {
      debugPrint('PlatformException');
    }
  }

  @override
  void onError(Exception error) {
    _barcodeString = 'Barcode: error';
    _barcodeSymbology = 'Symbology: error';
    setState(() {});
  }

  void onErrors(Object error) {
    _barcodeString = 'Barcode: error';
    _barcodeSymbology = 'Symbology: error';
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        qrHoneywellScan.controller?.resumeScanner();

      case AppLifecycleState.inactive:
        qrHoneywellScan.controller?.resumeScanner();
      case AppLifecycleState.paused:
        qrHoneywellScan.controller?.resumeScanner();
      case AppLifecycleState.detached:
        qrHoneywellScan.controller?.pauseScanner();
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          const Positioned.fill(
            child: ColoredBox(color: JcColors.sec600),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * jcs0255,
            top: MediaQuery.of(context).size.height * jcs05,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: jcs16),
                child: Text(
                  messageCenter,
                  style: JcTextStyle.body1.succ100,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: jcs15,
            child: IconButton(
              icon: qrHoneywellScan.iconFlash,
              onPressed: qrHoneywellScan.toggleFlash,
            ),
          ),
          Positioned(
            top: jcs46,
            right: jcs20,
            child: InkWell(
              onTap: () {
                focusNode.unfocus();
              },
              child: Container(
                padding: const EdgeInsets.all(jcs8),
                decoration: BoxDecoration(
                  color: JcColors.succ600.withOpacity(jcs07),
                  borderRadius: BorderRadius.circular(jcs8),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: jcs46,
                          width: MediaQuery.of(context).size.width * jcs09,
                          padding: const EdgeInsets.symmetric(horizontal: jcs8),
                          decoration: BoxDecoration(
                            color: JcColors.gsWhite,
                            borderRadius: BorderRadius.circular(jcs5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  focusNode: focusNode,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Ingrese el código',
                                    hintStyle: JcTextStyle.body1.sec600.w700,
                                    border: InputBorder.none,
                                  ),
                                  style: JcTextStyle.body1.succ100,
                                  onChanged: (value) {
                                    widget.onValueChanged(value);
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: JcColors.succ600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: jcs16),
                          child: Text(
                            errorMessage,
                            style: JcTextStyle.body1.succ300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
