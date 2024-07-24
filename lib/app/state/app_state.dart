import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData({
    @Default(0) int currentPageIndex,
  }) = _AppStateData;
}

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateData build() {
    return AppStateData();
  }

  changePageIndex(int index) {
    state = state.copyWith(currentPageIndex: index);
  }
}
