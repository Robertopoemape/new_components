import 'package:flutter/material.dart';

abstract class FunctionScan extends ChangeNotifier {
  dynamic get controller;

  final Icon _iconFlash = const Icon(Icons.flash_on, color: Colors.white);

  Icon get iconFlash => _iconFlash;

  Future<void> updateIconFlash() async {
    /*  if (controller != null) {
      final statusFlash = await controller.getFlashStatus()
      _iconFlash = statusFlash
          ? const Icon(Icons.flash_on, color: Colors.white)
          : const Icon(Icons.flash_off, color: Colors.white);
      notifyListeners();
    } */
  }

  Future<void> toggleFlash() async {
    if (controller != null) {
      await controller.toggleFlash();
      await updateIconFlash();
      notifyListeners();
    }
  }

  Future<void> onPermissionSet(
    BuildContext context,
    dynamic ctrl,
    bool permissionGranted,
  ) async {
    if (!permissionGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }
}
