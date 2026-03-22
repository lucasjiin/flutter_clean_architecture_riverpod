import 'package:flutter_riverpod/flutter_riverpod.dart';

// [Theme State]
// 테마 모드를 나타내는 enum
enum AppThemeMode { light, dark }

// [Theme Notifier]
// 테마 상태 관리 및 로직
final themeNotifierProvider = NotifierProvider<ThemeNotifier, AppThemeMode>(() {
  return ThemeNotifier();
});

class ThemeNotifier extends Notifier<AppThemeMode> {
  @override
  AppThemeMode build() {
    return AppThemeMode.light; // 기본값
  }

  void toggle() {
    state = state == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light;
  }
}
