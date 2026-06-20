import 'package:flutter/material.dart';

import '../services/settings_controller.dart';
import '../services/url_launcher_service.dart';
import 'about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.controller});

  final SettingsController controller;

  static const _privacyUrl =
      'https://operonte.github.io/releases/horasmedicas/policies/privacy_policy.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ThemeCard(controller: controller),
          const SizedBox(height: 16),
          _InfoCard(),
          const SizedBox(height: 16),
          _NavCard(
            icon: Icons.info_outline,
            title: 'Acerca de',
            subtitle: 'Información sobre la app y el desarrollador',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            ),
          ),
          const SizedBox(height: 16),
          _NavCard(
            icon: Icons.privacy_tip,
            title: 'Política de Privacidad',
            subtitle: 'Lee nuestra política de privacidad',
            onTap: () => UrlLauncherService.open(
              context,
              _privacyUrl,
              errorContext: 'la política de privacidad',
            ),
          ),
        ],
      ),
    );
  }
}

/// Selector de tema (claro / oscuro / sistema), persistido.
class _ThemeCard extends StatelessWidget {
  const _ThemeCard({required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.palette_outlined, color: scheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Apariencia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: scheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ListenableBuilder(
              listenable: controller,
              builder: (context, _) => SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(
                    value: ThemeMode.light,
                    icon: Icon(Icons.light_mode),
                    label: Text('Claro'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.system,
                    icon: Icon(Icons.brightness_auto),
                    label: Text('Auto'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    icon: Icon(Icons.dark_mode),
                    label: Text('Oscuro'),
                  ),
                ],
                selected: {controller.themeMode},
                onSelectionChanged: (selection) =>
                    controller.setThemeMode(selection.first),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: scheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Información',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: scheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.local_hospital, color: scheme.primary),
              title: const Text('Acceso rápido a clínicas'),
              subtitle: const Text('8 clínicas médicas disponibles'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.location_on, color: scheme.primary),
              title: const Text('Ubicación'),
              subtitle: const Text('Rancagua, Chile'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.language, color: scheme.primary),
              title: const Text('Idioma'),
              subtitle: const Text('Español'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: scheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: scheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}
