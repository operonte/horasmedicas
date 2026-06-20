import 'package:flutter_test/flutter_test.dart';
import 'package:horasmedicas/models/clinic_link.dart';

void main() {
  group('ClinicLink', () {
    const clinic = ClinicLink(
      name: 'Clínica MEDS',
      url: 'https://www.meds.cl/',
      domain: 'meds.cl',
    );

    test('matches por nombre (insensible a mayúsculas)', () {
      expect(clinic.matches('meds'), isTrue);
      expect(clinic.matches('MEDS'), isTrue);
      expect(clinic.matches('clínica'), isTrue);
    });

    test('matches por dominio', () {
      expect(clinic.matches('meds.cl'), isTrue);
    });

    test('matches vacío devuelve true', () {
      expect(clinic.matches(''), isTrue);
      expect(clinic.matches('   '), isTrue);
    });

    test('no coincide con texto ajeno', () {
      expect(clinic.matches('xyz'), isFalse);
    });

    test('initial es la primera letra en mayúscula', () {
      expect(clinic.initial, 'C');
    });

    test('mapsSearchUrl es HTTPS y contiene el nombre codificado', () {
      final url = Uri.parse(clinic.mapsSearchUrl);
      expect(url.scheme, 'https');
      expect(url.host, 'www.google.com');
      expect(clinic.mapsSearchUrl, contains('Cl%C3%ADnica%20MEDS'));
    });

    test('avatarColor es determinista para el mismo dominio', () {
      expect(clinic.avatarColor, equals(clinic.avatarColor));
    });

    test('todas las clínicas usan HTTPS', () {
      for (final c in ClinicLink.availableClinics) {
        expect(Uri.parse(c.url).scheme, 'https', reason: c.name);
      }
    });
  });
}
