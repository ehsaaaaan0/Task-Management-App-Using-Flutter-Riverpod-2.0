import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dates_provider.g.dart';

@riverpod
class DateState extends _$DateState {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}