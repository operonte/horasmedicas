import 'package:flutter/material.dart';

import '../models/clinic_link.dart';
import '../services/url_launcher_service.dart';

/// Acciones disponibles en el menú de cada clínica.
enum _ClinicAction { openWeb, directions }

/// Tarjeta de una clínica: avatar, nombre, dominio, favorito y acciones.
class ClinicCard extends StatelessWidget {
  const ClinicCard({
    super.key,
    required this.clinic,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final ClinicLink clinic;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  Future<void> _openWeb(BuildContext context) {
    return UrlLauncherService.open(
      context,
      clinic.url,
      errorContext: 'la página de ${clinic.name}',
    );
  }

  Future<void> _openDirections(BuildContext context) {
    return UrlLauncherService.open(
      context,
      clinic.mapsSearchUrl,
      errorContext: 'el mapa de ${clinic.name}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Semantics(
        label: 'Abrir página web de ${clinic.name}',
        button: true,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: clinic.avatarColor,
            child: Text(
              clinic.initial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          title: Text(
            clinic.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(clinic.domain),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? scheme.primary : null,
                ),
                tooltip: isFavorite
                    ? 'Quitar de favoritos'
                    : 'Marcar como favorito',
                onPressed: onToggleFavorite,
              ),
              PopupMenuButton<_ClinicAction>(
                tooltip: 'Más acciones',
                icon: const Icon(Icons.more_vert),
                onSelected: (action) {
                  switch (action) {
                    case _ClinicAction.openWeb:
                      _openWeb(context);
                    case _ClinicAction.directions:
                      _openDirections(context);
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: _ClinicAction.openWeb,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.open_in_new),
                      title: Text('Abrir sitio web'),
                    ),
                  ),
                  PopupMenuItem(
                    value: _ClinicAction.directions,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.directions),
                      title: Text('Cómo llegar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () => _openWeb(context),
        ),
      ),
    );
  }
}
