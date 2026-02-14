/// Modelo que representa un enlace a una clínica médica.
class ClinicLink {
  final String title;
  final String url;
  final String domain;

  const ClinicLink({
    required this.title,
    required this.url,
    required this.domain,
  });

  /// URL del favicon de la clínica (usa el icono real de cada sitio web).
  String get faviconUrl =>
      'https://www.google.com/s2/favicons?domain=${Uri.parse(url).host}&sz=128';

  /// Lista de clínicas disponibles en Rancagua.
  static const List<ClinicLink> availableClinics = [
    ClinicLink(
      title: 'Clinica MEDS.CL',
      url: 'https://www.meds.cl/',
      domain: 'meds.cl',
    ),
    ClinicLink(
      title: 'Clinica FUSAT',
      url: 'https://www.fusat.cl/',
      domain: 'fusat.cl',
    ),
    ClinicLink(
      title: 'Clinica ISAMEDICA',
      url: 'https://clinicaisamedica.cl/',
      domain: 'clinicaisamedica.cl',
    ),
    ClinicLink(
      title: 'Clinica INTEGRAMEDICA',
      url: 'https://www.integramedica.cl/',
      domain: 'integramedica.cl',
    ),
    ClinicLink(
      title: 'Clinica INTERSALUD',
      url: 'https://www.intersalud.cl/',
      domain: 'intersalud.cl',
    ),
    ClinicLink(
      title: 'Clinica TORREMEDICA',
      url: 'https://www.torremedica.cl/',
      domain: 'torremedica.cl',
    ),
    ClinicLink(
      title: 'Clinica REDSALUD',
      url: 'https://www.redsalud.cl/',
      domain: 'redsalud.cl',
    ),
    ClinicLink(
      title: 'Clinica CLEVERSALUD',
      url: 'https://cleversalud.cl/',
      domain: 'cleversalud.cl',
    ),
  ];
}
