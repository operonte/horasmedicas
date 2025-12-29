import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horas Médicas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LinksPage(),
    );
  }
}

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  // Lista de enlaces con iconos
  final List<Map<String, String>> links = const [
    {
      'title': 'Clinica MEDS.CL',
      'url': 'https://www.meds.cl/',
      'domain': 'meds.cl',
    },
    {
      'title': 'Clinica FUSAT',
      'url': 'https://www.fusat.cl/',
      'domain': 'fusat.cl',
    },
    {
      'title': 'Clinica ISAMEDICA',
      'url': 'https://clinicaisamedica.cl/',
      'domain': 'clinicaisamedica.cl',
    },
    {
      'title': 'Clinica INTEGRAMEDICA',
      'url': 'https://www.integramedica.cl/',
      'domain': 'integramedica.cl',
    },
    {
      'title': 'Clinica INTERSALUD',
      'url': 'https://www.intersalud.cl/',
      'domain': 'intersalud.cl',
    },
    {
      'title': 'Clinica TORREMEDICA',
      'url': 'https://www.torremedica.cl/',
      'domain': 'torremedica.cl',
    },
    {
      'title': 'Clinica REDSALUD',
      'url': 'https://www.redsalud.cl/',
      'domain': 'redsalud.cl',
    },
    {
      'title': 'Clinica CLEVERSALUD',
      'url': 'https://cleversalud.cl/',
      'domain': 'cleversalud.cl',
    },
  ];

  // Función para obtener URL del favicon
  String _getFaviconUrl(String domain) {
    return 'https://www.google.com/s2/favicons?domain=$domain&sz=64';
  }

  Future<void> _launchURL(String url, BuildContext context) async {
    try {
      final Uri uri = Uri.parse(url);

      // En web, usar LaunchMode.platformDefault para abrir en nueva pestaña
      // En otras plataformas, usar LaunchMode.externalApplication
      final LaunchMode launchMode = kIsWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication;

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: launchMode);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No se pudo abrir $url'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al abrir la URL: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            tooltip: 'Configuración',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            final domain = links[index]['domain']!;
            final faviconUrl = _getFaviconUrl(domain);

            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                  child: ClipOval(
                    child: Image.network(
                      faviconUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.local_hospital,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                title: Text(
                  links[index]['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.open_in_new),
                onTap: () => _launchURL(links[index]['url']!, context),
              ),
            );
          },
        ),
      ),
    );
  }
}
