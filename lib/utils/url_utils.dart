/// Utilidades para validar y trabajar con URLs.
class UrlValidator {
  UrlValidator._();

  /// Genera la URL del favicon de Google para un dominio.
  static String getFaviconUrl(String domain) {
    return 'https://www.google.com/s2/favicons?domain=$domain&sz=64';
  }
}
