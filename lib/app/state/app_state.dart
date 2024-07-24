import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData({
    @Default(null) User? user,
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

  setUserState(User? user) {
    state = state.copyWith(user: user);
  }
}
