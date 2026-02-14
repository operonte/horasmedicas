import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horasmedicas/main.dart';

void main() {
  testWidgets('App muestra pantalla principal con título Horas Médicas',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Horas Médicas'), findsWidgets);
  });

  testWidgets('App muestra al menos una clínica en la lista',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Clinica MEDS.CL'), findsOneWidget);
  });

  testWidgets('App muestra botón de configuración',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}
