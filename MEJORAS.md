# Lista de Mejoras - Horas Médicas

## Implementado (v1.2.0)

### Seguridad (OWASP MASVS / Mobile Top 10)
- Secretos de firma fuera del repo (keystore y `key.properties` en `.gitignore`,
  historial de git limpiado).
- Avatares generados localmente en lugar de favicons de Google (sin fuga de
  privacidad ni dependencia de red de terceros).
- Apertura de URLs con lista blanca de esquemas (`https`, `mailto`, `tel`).
- `allowBackup=false` + reglas de extracción de datos (Android 12+).
- Solo HTTPS (Android `usesCleartextTraffic=false`, iOS ATS estricto, sin `http`).
- Ofuscación y reducción de código/recursos (R8) en release.
- `SECURITY.md` con la política de seguridad.

### Funcionalidad / UX
- Tema configurable y persistente (claro / oscuro / sistema) con `shared_preferences`.
- Favoritos persistentes (se anclan arriba de la lista).
- Acción "Cómo llegar" por clínica (búsqueda en Google Maps).
- Búsqueda por nombre **y** dominio, con botón de limpiar.
- Color de marca unificado (teal `#0D9488`) en toda la app.
- Servicio de apertura de URLs centralizado (sin código duplicado).
- Más pruebas (búsqueda, estado vacío, favoritos, modelo).

## Implementado (v1.1.0)

- Búsqueda/filtro de clínicas
- Mensajes de error amigables (conexión a internet)
- Accesibilidad (semántica en ListTiles)
- Modo oscuro (ThemeMode.system, colores del tema)
- Colores adaptativos (sin Colors.grey/red hardcodeados)

## Cambios aplicados (producción)

### Android
- `INTERNET`: Permiso para abrir URLs y cargar favicons
- `queries`: VIEW (https, http), VIEW y SENDTO (mailto) para package visibility Android 11+
- `usesCleartextTraffic="false"`: Solo tráfico HTTPS en producción
- `tools:targetApi="31"`: Compatibilidad con herramientas modernas

### iOS
- `LSApplicationQueriesSchemes`: https, http, mailto para url_launcher
- `ITSAppUsesNonExemptEncryption`: NO (solo HTTPS, evita preguntas en App Store)
- `NSAppTransportSecurity`: Configuración segura, sin cargas arbitrarias

---

## Mejoras recomendadas

### Prioridad alta

1. **Firma de release (Android)**
   - Crear keystore y configurar `signingConfig` en `build.gradle.kts` para releases
   - No publicar en Play Store con firma de debug

2. **Firma de release (iOS)**
   - Configurar certificados de distribución en Xcode
   - Habilitar Automatic Signing con el Apple Developer Team

3. **Pruebas en dispositivos reales**
   - Probar abrir clínicas, correo y política en Android e iOS
   - Verificar favicons con conexión lenta o sin datos

### Prioridad media

4. **Manejo de errores de red**
   - Mostrar mensaje claro si no hay internet al abrir URL
   - Evitar fallo silencioso al cargar favicons

5. **Accesibilidad**
   - Añadir `semanticsLabel` en `ListTile` para lectores de pantalla
   - Etiquetar imágenes (favicons) con descripción alternativa

6. **Modo oscuro**
   - Comprobar contraste y legibilidad en tema oscuro
   - Ajustar colores fijos (`Colors.grey`, etc.) al tema

7. **Cache de favicons**
   - Cachear favicons para reducir llamadas a la red
   - Usar `cached_network_image` o similar

### Prioridad baja

8. **Búsqueda/filtro**
   - Campo de búsqueda para filtrar clínicas por nombre

9. **Orden y favoritos**
   - Permitir marcar clínicas como favoritas
   - Guardar preferencias con SharedPreferences o similar

10. **Notificaciones**
    - Recordatorio opcional para citas (requiere más permisos y lógica)

11. **Internacionalización**
    - Soporte multiidioma si se planea uso fuera de Chile

12. **Analytics (opcional)**
    - Analytics anónimo para ver clínicas más usadas (solo si encaja con la política de privacidad)

### Requisitos de tiendas

13. **App Store (iOS)**
    - Screenshots para iPhone (6.7", 6.5", 5.5") e iPad
    - Descripción, palabras clave y categoría (Medicina/Salud)
    - URL de política de privacidad ya disponible

14. **Play Store (Android)**
    - Screenshots para phone y tablet
    - Descripción corta y larga
    - Clasificación de contenido (probablemente para todos los públicos)
    - Declaración de permisos en ficha de la app
