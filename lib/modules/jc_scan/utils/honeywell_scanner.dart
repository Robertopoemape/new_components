/// ignore_for_file: constant_identifier_names, avoid_setters_without_getters
library;

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:jc_module/modules/jc_scan/jc_scan.dart';

class HoneywellScanner {
  HoneywellScanner({
    ScannerCallback? scannerCallback,
    OnScannerDecodeCallback? onScannerDecodeCallback,
    OnScannerErrorCallback? onScannerErrorCallback,
  }) {
    _channel.setMethodCallHandler(_onMethodCall);
    _scannerCallback = scannerCallback;
    _onScannerDecodeCallback = onScannerDecodeCallback;
    _onScannerErrorCallback = onScannerErrorCallback;
  }
  static const String _METHOD_CHANNEL = 'honeywellscanner';
  static const String _IS_SUPPORTED = 'isSupported';
  static const String _IS_STARTED = 'isStarted';
  static const String _SET_PROPERTIES = 'setProperties';
  static const String _START_SCANNER = 'startScanner';
  static const String _RESUME_SCANNER = 'resumeScanner';
  static const String _PAUSE_SCANNER = 'pauseScanner';
  static const String _STOP_SCANNER = 'stopScanner';
  static const String _SOFTWARE_TRIGGER = 'softwareTrigger';
  static const String _START_SCANNING = 'startScanning';
  static const String _STOP_SCANNING = 'stopScanning';
  static const String _ON_DECODED = 'onDecoded';
  static const String _ON_ERROR = 'onError';

  static const MethodChannel _channel = MethodChannel(_METHOD_CHANNEL);
  ScannerCallback? _scannerCallback;
  OnScannerDecodeCallback? _onScannerDecodeCallback;
  OnScannerErrorCallback? _onScannerErrorCallback;

  set scannerCallback(ScannerCallback scannerCallback) =>
      _scannerCallback = scannerCallback;

  set onScannerDecodeCallback(OnScannerDecodeCallback value) =>
      _onScannerDecodeCallback = value;

  set onScannerErrorCallback(OnScannerErrorCallback value) =>
      _onScannerErrorCallback = value;

  Future<void> _onMethodCall(MethodCall call) async {
    try {
      switch (call.method) {
        case _ON_DECODED:
          onDecoded(call.arguments as Map<dynamic, dynamic>?);
        case _ON_ERROR:
          onError(Exception(call.arguments));
        default:
          log(call.arguments.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  ///Called when decoder has successfully decoded the code
  ///<br>
  ///Note that this method always called on a worker thread
  ///
  ///@param scannedData Encapsulates the result of decoding a barcode within an image
  void onDecoded(Map<dynamic, dynamic>? scannedDataMap) {
    if (scannedDataMap != null) {
      final scannedData = ScannedData.fromMap(scannedDataMap);
      _scannerCallback?.onDecoded(scannedData);
      _onScannerDecodeCallback?.call(scannedData);
    }
  }

  ///Called when error has occurred
  ///<br>
  ///Note that this method always called on a worker thread
  ///
  ///@param error Exception that has been thrown
  void onError(Exception error) {
    _scannerCallback?.onError(error);
    _onScannerErrorCallback?.call(error);
  }

  Future<bool> isSupported() async {
    if (kIsWeb || !Platform.isAndroid) {
      return false;
    }
    return await _channel.invokeMethod<bool>(_IS_SUPPORTED) ?? false;
  }

  Future<bool> isStarted() async {
    if (kIsWeb || !Platform.isAndroid) {
      return false;
    }

    return await _channel.invokeMethod<bool>(_IS_STARTED) ?? false;
  }

  Future<void> setProperties(Map<String, dynamic> mapProperties) =>
      _channel.invokeMethod(_SET_PROPERTIES, mapProperties);

  Future<bool> startScanner() async =>
      await _channel.invokeMethod<bool>(_START_SCANNER) ?? false;

  Future<bool> resumeScanner() async =>
      await _channel.invokeMethod<bool>(_RESUME_SCANNER) ?? false;

  Future<bool> pauseScanner() async =>
      await _channel.invokeMethod<bool>(_PAUSE_SCANNER) ?? false;

  Future<bool> stopScanner() async =>
      await _channel.invokeMethod<bool>(_STOP_SCANNER) ?? false;

  Future<bool> softwareTrigger(bool state) async =>
      await _channel.invokeMethod<bool>(_SOFTWARE_TRIGGER, state) ?? false;

  Future<bool> startScanning() async =>
      await _channel.invokeMethod<bool>(_START_SCANNING) ?? false;

  Future<bool> stopScanning() async =>
      await _channel.invokeMethod<bool>(_STOP_SCANNING) ?? false;
}
