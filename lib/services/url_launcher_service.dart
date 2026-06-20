import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Resultado de un intento de apertura de URL.
enum LaunchResult { success, invalid, failed }

/// Servicio centralizado y seguro para abrir URLs externas.
///
/// Seguridad (OWASP MASVS-CODE / M4 - Insufficient Input/Output Validation):
/// solo se permiten esquemas de una lista blanca. Cualquier URL con un
/// esquema distinto (p. ej. `javascript:`, `file:`, `intent:`) se rechaza
/// antes de pasar al sistema operativo.
class UrlLauncherService {
  UrlLauncherService._();

  /// Esquemas permitidos. Mantener mínimo: solo lo que la app usa.
  static const Set<String> _allowedSchemes = {'https', 'mailto', 'tel'};

  /// Valida y normaliza una URL. Devuelve `null` si no es segura.
  static Uri? _safeUri(String raw) {
    final uri = Uri.tryParse(raw.trim());
    if (uri == null) return null;
    if (!_allowedSchemes.contains(uri.scheme.toLowerCase())) return null;
    return uri;
  }

  /// Abre [url] de forma segura. Si falla, muestra un SnackBar con [errorContext].
  static Future<LaunchResult> open(
    BuildContext context,
    String url, {
    String? errorContext,
  }) async {
    // Capturamos el messenger antes de cualquier await para no usar el
    // BuildContext a través de un async gap (patrón recomendado por Flutter).
    final messenger = ScaffoldMessenger.of(context);
    final errorColor = Theme.of(context).colorScheme.error;

    void showError(String message) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: errorColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    final uri = _safeUri(url);
    if (uri == null) {
      showError('Enlace no válido o no permitido.');
      return LaunchResult.invalid;
    }

    final target = errorContext ?? 'el enlace';
    try {
      // Los enlaces https se abren en el navegador externo; mailto/tel en su app.
      final mode = kIsWeb
          ? LaunchMode.platformDefault
          : (uri.scheme == 'https'
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);

      final launched = await launchUrl(uri, mode: mode);
      if (!launched) {
        showError('No se pudo abrir $target. Comprueba tu conexión.');
        return LaunchResult.failed;
      }
      return LaunchResult.success;
    } catch (_) {
      showError('Error al abrir $target. Comprueba tu conexión.');
      return LaunchResult.failed;
    }
  }
}
