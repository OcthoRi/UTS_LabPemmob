import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _base(Brightness b) => ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3F51B5), brightness: b),
      );
  static final light = _base(Brightness.light);
  static final dark = _base(Brightness.dark);
}

/// Helper ukuran dinamis berdasarkan lebar layar (tanpa nilai hardcode).
extension Responsive on BuildContext {
  double get sw => MediaQuery.sizeOf(this).width;
  double get contentWidth => sw > 600 ? sw * 0.55 : sw;
  double get base => contentWidth.clamp(280, 640).toDouble();
  double sp(double f) => base * f;
}