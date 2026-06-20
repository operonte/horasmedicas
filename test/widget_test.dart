import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:horasmedicas/main.dart';
import 'package:horasmedicas/services/settings_controller.dart';

Future<SettingsController> _buildController([Map<String, Object> seed = const {}]) async {
  SharedPreferences.setMockInitialValues(seed);
  final prefs = await SharedPreferences.getInstance();
  return SettingsController(prefs)..load();
}

void main() {
  testWidgets('Muestra la pantalla principal con título Horas Médicas',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();
    expect(find.text('Horas Médicas'), findsWidgets);
  });

  testWidgets('Muestra al menos una clínica en la lista',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();
    expect(find.text('Clínica MEDS'), findsOneWidget);
  });

  testWidgets('Muestra botón de configuración y campo de búsqueda',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('La búsqueda filtra las clínicas por nombre',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'fusat');
    await tester.pump();

    expect(find.text('Clínica FUSAT'), findsOneWidget);
    expect(find.text('Clínica MEDS'), findsNothing);
  });

  testWidgets('Búsqueda sin resultados muestra mensaje vacío',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'zzzzz');
    await tester.pump();

    expect(find.textContaining('No se encontraron clínicas'), findsOneWidget);
  });

  testWidgets('Marcar favorito muestra la sección Favoritos',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(controller: await _buildController()));
    await tester.pump();

    expect(find.text('Favoritos'), findsNothing);
    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();
    expect(find.text('Favoritos'), findsOneWidget);
  });
}
