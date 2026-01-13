import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void completeSplash() {
    state = false;
  }
}

final splashProvider = NotifierProvider<SplashNotifier, bool>(
  SplashNotifier.new,
);
