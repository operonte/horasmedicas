import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // Lista de enlaces
  final List<Map<String, String>> links = const [
    {'title': 'Clinica MEDS.CL', 'url': 'https://www.meds.cl/'},
    {'title': 'Clinica FUSAT', 'url': 'https://www.fusat.cl/'},
    {'title': 'Clinica ISAMEDICA', 'url': 'https://clinicaisamedica.cl/'},
    {'title': 'Clinica INTEGRAMEDICA', 'url': 'https://www.integramedica.cl/'},
    {'title': 'Clinica INTERSALUD', 'url': 'https://www.intersalud.cl/'},
    {'title': 'Clinica TORREMEDICA', 'url': 'https://www.torremedica.cl/'},
    {'title': 'Clinica REDSALUD', 'url': 'https://www.redsalud.cl/'},
    {'title': 'Clinica CLEVERSALUD', 'url': 'https://cleversalud.cl/'},
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Enlaces'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              child: ListTile(
                title: Text(
                  links[index]['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.open_in_new),
                onTap: () => _launchURL(links[index]['url']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
