import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/clinic_link.dart';
import 'screens/settings_screen.dart';
import 'services/settings_controller.dart';
import 'theme/app_theme.dart';
import 'widgets/clinic_card.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final controller = SettingsController(prefs)..load();
  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return MaterialApp(
          title: 'Horas Médicas',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: controller.themeMode,
          home: LinksPage(controller: controller),
        );
      },
    );
  }
}

class LinksPage extends StatefulWidget {
  const LinksPage({super.key, required this.controller});

  final SettingsController controller;

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _searchQuery = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Horas Médicas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsScreen(controller: widget.controller),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Semantics(
              textField: true,
              label: 'Buscar clínica por nombre o dominio',
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Buscar clínica...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          tooltip: 'Limpiar búsqueda',
                          onPressed: _clearSearch,
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: widget.controller,
              builder: (context, _) => _buildList(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final controller = widget.controller;
    final matches = ClinicLink.availableClinics
        .where((c) => c.matches(_searchQuery))
        .toList();

    if (matches.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            _searchQuery.isEmpty
                ? 'No hay clínicas disponibles'
                : 'No se encontraron clínicas para "$_searchQuery"',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    final favorites = matches
        .where((c) => controller.isFavorite(c.domain))
        .toList();
    final others = matches
        .where((c) => !controller.isFavorite(c.domain))
        .toList();
    final showHeaders = favorites.isNotEmpty;

    Widget card(ClinicLink clinic) => ClinicCard(
      clinic: clinic,
      isFavorite: controller.isFavorite(clinic.domain),
      onToggleFavorite: () => controller.toggleFavorite(clinic.domain),
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (showHeaders) _SectionHeader('Favoritos'),
        ...favorites.map(card),
        if (showHeaders && others.isNotEmpty)
          _SectionHeader('Todas las clínicas'),
        ...others.map(card),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
