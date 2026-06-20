# Política de Seguridad — Horas Médicas

## Reporte de vulnerabilidades

Si encuentras un problema de seguridad, por favor **no abras un issue público**.
Escríbenos a: **cristian.bravo.droguett@gmail.com** con una descripción y, si es
posible, pasos para reproducirlo. Responderemos lo antes posible.

## Medidas de seguridad implementadas

Esta app es un lanzador de enlaces a sitios web de clínicas; no recopila ni
transmite datos personales. Aun así, se aplican controles alineados con
**OWASP MASVS / Mobile Top 10**:

### Datos y privacidad
- **No se recopilan datos personales** ni se usan analytics de terceros.
- **Sin favicons remotos:** los iconos se generan localmente (avatar con la
  inicial de la clínica). No se envía a terceros qué clínicas consulta el usuario.
- **Backup deshabilitado** (`allowBackup=false` + reglas de extracción de datos
  en Android 12+) para evitar exfiltración vía `adb backup` o transferencia.
- Las preferencias locales (tema, favoritos) se guardan solo en el dispositivo.

### Red (MASVS-NETWORK)
- **Solo HTTPS.** `usesCleartextTraffic=false` en Android y App Transport
  Security sin cargas arbitrarias (`NSAllowsArbitraryLoads=false`) en iOS.
- Esquemas de URL en lista blanca (`https`, `mailto`, `tel`); cualquier otro se
  rechaza antes de llegar al sistema operativo
  (`lib/services/url_launcher_service.dart`).

### Código y build (MASVS-CODE / RESILIENCE)
- **Ofuscación y reducción de código y recursos (R8)** en builds de release.
- **Permisos mínimos:** solo `INTERNET`.
- **Sin secretos en el repositorio.** El keystore de firma y `key.properties`
  están en `.gitignore` y fuera del control de versiones.

## Firma de la aplicación

El APK de release se firma con una clave privada que **no** se incluye en este
repositorio. La huella de firma puede verificarse en el APK publicado en
[Releases](../../releases).
