import 'package:flutter/material.dart';

/// Modelo que representa un enlace a una clínica médica.
class ClinicLink {
  /// Nombre legible de la clínica (se muestra en la lista).
  final String name;

  /// URL del sitio web (siempre HTTPS).
  final String url;

  /// Dominio de la clínica. Se usa como identificador estable para
  /// favoritos y para la búsqueda.
  final String domain;

  /// Teléfono de contacto en formato internacional (opcional).
  /// Se deja `null` cuando no hay un número verificado: la app no muestra
  /// la acción "Llamar" para datos no confirmados.
  final String? phone;

  /// Ruta al logo de la clínica empaquetado como asset local (opcional).
  /// Se sirve desde `assets/clinics/`: nunca se pide a un servicio externo
  /// (evita filtrar a terceros qué clínicas consulta cada usuario). Si es
  /// `null`, la tarjeta usa el avatar de color + inicial como respaldo.
  final String? logoAsset;

  const ClinicLink({
    required this.name,
    required this.url,
    required this.domain,
    this.phone,
    this.logoAsset,
  });

  /// Inicial para el avatar (primera letra del nombre).
  String get initial {
    final trimmed = name.trim();
    return trimmed.isEmpty ? '?' : trimmed.characters.first.toUpperCase();
  }

  /// Búsqueda en Google Maps por el nombre de la clínica en Rancagua.
  /// Es una búsqueda (no una dirección fija inventada), así que abre el
  /// lugar real sin riesgo de mostrar datos incorrectos.
  String get mapsSearchUrl =>
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent('$name Rancagua Chile')}';

  /// ¿Coincide la clínica con el texto de búsqueda (nombre o dominio)?
  bool matches(String query) {
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return true;
    return name.toLowerCase().contains(q) || domain.toLowerCase().contains(q);
  }

  /// Color determinista para el avatar, derivado del dominio.
  /// Mismo dominio → mismo color siempre, sin llamadas de red.
  Color get avatarColor {
    const palette = <Color>[
      Color(0xFF0D9488), // teal (marca)
      Color(0xFF2563EB), // azul
      Color(0xFF7C3AED), // violeta
      Color(0xFF059669), // verde
      Color(0xFFD97706), // ámbar
      Color(0xFFDB2777), // rosa
      Color(0xFF0891B2), // cian
      Color(0xFF4F46E5), // índigo
    ];
    return palette[domain.hashCode.abs() % palette.length];
  }

  /// Lista de clínicas disponibles en Rancagua.
  static const List<ClinicLink> availableClinics = [
    ClinicLink(
      name: 'Clínica MEDS',
      url: 'https://www.meds.cl/',
      domain: 'meds.cl',
      logoAsset: 'assets/clinics/meds.png',
    ),
    ClinicLink(
      name: 'Clínica FUSAT',
      url: 'https://www.fusat.cl/',
      domain: 'fusat.cl',
      logoAsset: 'assets/clinics/fusat.png',
    ),
    ClinicLink(
      name: 'Clínica Isamédica',
      url: 'https://clinicaisamedica.cl/',
      domain: 'clinicaisamedica.cl',
      logoAsset: 'assets/clinics/isamedica.png',
    ),
    ClinicLink(
      name: 'IntegraMédica',
      url: 'https://www.integramedica.cl/',
      domain: 'integramedica.cl',
      logoAsset: 'assets/clinics/integramedica.png',
    ),
    ClinicLink(
      name: 'Clínica Intersalud',
      url: 'https://www.intersalud.cl/',
      domain: 'intersalud.cl',
      logoAsset: 'assets/clinics/intersalud.png',
    ),
    ClinicLink(
      name: 'TorreMédica',
      url: 'https://www.torremedica.cl/',
      domain: 'torremedica.cl',
      logoAsset: 'assets/clinics/torremedica.png',
    ),
    ClinicLink(
      name: 'RedSalud',
      url: 'https://www.redsalud.cl/',
      domain: 'redsalud.cl',
      logoAsset: 'assets/clinics/redsalud.png',
    ),
    ClinicLink(
      name: 'CleverSalud',
      url: 'https://cleversalud.cl/',
      domain: 'cleversalud.cl',
      logoAsset: 'assets/clinics/cleversalud.png',
    ),
  ];
}
