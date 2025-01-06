import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jc_module/core/configs/services/secure_storage_service.dart';

class TokenTimeNotifier extends StateNotifier<int> {
  TokenTimeNotifier() : super(0) {
    startTimer();
  }

  Timer? _timer;

  Future<void> loadInitialTime() async {
    final remainingStorage =
        await SecureStorageService().getReimaingTimeSession();
    state = remainingStorage ?? 0;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state <= 0) {
        timer.cancel();
      } else {
        state = state - 1;
      }
    });
  }

  void resetTimer(int newTime) {
    _timer?.cancel();
    state = newTime;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final tokenTimeProvider = StateNotifierProvider<TokenTimeNotifier, int>((ref) {
  final notifier = TokenTimeNotifier()..loadInitialTime();
  return notifier;
});
