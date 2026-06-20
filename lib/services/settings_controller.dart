import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Controla las preferencias del usuario (tema y favoritos) y las persiste
/// con [SharedPreferences]. Notifica a la UI ante cualquier cambio.
class SettingsController extends ChangeNotifier {
  SettingsController(this._prefs);

  final SharedPreferences _prefs;

  static const _kThemeMode = 'theme_mode';
  static const _kFavorites = 'favorites';

  ThemeMode _themeMode = ThemeMode.system;
  Set<String> _favorites = <String>{};

  ThemeMode get themeMode => _themeMode;
  Set<String> get favorites => Set.unmodifiable(_favorites);

  /// Carga las preferencias guardadas. Llamar una vez al iniciar la app.
  void load() {
    final modeIndex = _prefs.getInt(_kThemeMode);
    if (modeIndex != null && modeIndex >= 0 && modeIndex < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[modeIndex];
    }
    _favorites = (_prefs.getStringList(_kFavorites) ?? const <String>[]).toSet();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
    await _prefs.setInt(_kThemeMode, mode.index);
  }

  bool isFavorite(String domain) => _favorites.contains(domain);

  Future<void> toggleFavorite(String domain) async {
    if (!_favorites.add(domain)) {
      _favorites.remove(domain);
    }
    notifyListeners();
    await _prefs.setStringList(_kFavorites, _favorites.toList());
  }
}
