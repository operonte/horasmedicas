import 'package:flutter/material.dart';

/// Tema y color de marca de la app.
class AppTheme {
  AppTheme._();

  /// Color de marca (teal). Coincide con el icono y los assets de la tienda.
  static const Color brandColor = Color(0xFF0D9488);

  static ThemeData light() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: brandColor),
        useMaterial3: true,
      );

  static ThemeData dark() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      );
}
