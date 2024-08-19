import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'xpension_provider.g.dart';

@riverpod
class XpensionState extends _$XpensionState {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}

@riverpod
class XpensionState0 extends _$XpensionState0 {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}
