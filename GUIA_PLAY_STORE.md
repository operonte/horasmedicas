# Guía: Publicar Horas Médicas en Google Play Store

## Requisitos previos

1. **Cuenta de Google Play Developer** ($25 USD único)
   - Regístrate en: https://play.google.com/console/signup
   - Necesitas tarjeta de crédito/débito

2. **App lista para producción**
   - APK o AAB firmado (actualmente usas firma debug; para producción necesitas keystore propio)

---

## Paso 1: Crear el App Bundle (recomendado por Google)

```bash
cd /home/corban/LAB/proyectos/horasmedicas
flutter build appbundle --release
```

El archivo se genera en: `build/app/outputs/bundle/release/app-release.aab`

> **Nota:** Para publicación en Play Store es mejor usar **App Bundle (.aab)** que APK. El AAB permite que Google optimice la descarga según el dispositivo.

---

## Paso 2: Firma para producción (importante)

Actualmente el AAB se firma con la clave de debug. Para publicar en Play Store necesitas:

### 2.1 Crear un keystore (solo la primera vez)

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Guarda bien la contraseña y el alias. **Si pierdes el keystore, no podrás actualizar la app.**

### 2.2 Crear `key.properties` (no subir a git)

En la raíz del proyecto, crea `android/key.properties`:

```properties
storePassword=TU_CONTRASEÑA
keyPassword=TU_CONTRASEÑA
keyAlias=upload
storeFile=/ruta/completa/a/upload-keystore.jks
```

### 2.3 Modificar `android/app/build.gradle.kts`

Añadir antes del bloque `android {`:

```kotlin
val keystoreProperties = java.util.Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}
```

Y dentro de `buildTypes { release { ... } }`:

```kotlin
signingConfig = signingConfigs.getByName("debug")
// Reemplazar por:
signingConfig = signingConfigs.create("release") {
    keyAlias = keystoreProperties["keyAlias"] as String
    keyPassword = keystoreProperties["keyPassword"] as String
    storeFile = file(keystoreProperties["storeFile"] as String)
    storePassword = keystoreProperties["storePassword"] as String
}
```

(Configuración completa disponible en la documentación de Flutter)

### 2.4 Añadir `key.properties` al .gitignore

```
android/key.properties
*.jks
```

---

## Paso 3: Entrar a Google Play Console

1. Ve a https://play.google.com/console
2. Inicia sesión con tu cuenta de desarrollador

---

## Paso 4: Crear la aplicación

1. Clic en **"Crear aplicación"**
2. Rellena:
   - **Nombre de la app:** Horas Médicas
   - **Idioma predeterminado:** Español (Chile)
   - **Tipo:** Aplicación o juego
   - **Categoría:** Medicina
3. Acepta las declaraciones y crea

---

## Paso 5: Completar la ficha de la tienda

En el menú lateral: **"Ficha de la tienda"** → **"Ficha de la tienda principal"**

| Campo | Contenido |
|-------|-----------|
| **Nombre de la aplicación** | Horas Médicas |
| **Descripción breve** (80 caracteres) | Acceso rápido a clínicas médicas en Rancagua para reservar horas |
| **Descripción completa** | Texto más largo describiendo la app, las 8 clínicas, etc. |
| **Gráfico:** Icono 512x512 | `assets/app_icon_1024.png` (redimensionar a 512) |
| **Gráfico:** Imagen de función 1024x500 | Captura o banner representativo |

---

## Paso 6: Clasificación de contenido

1. Menú **"Política"** → **"Clasificación de contenido"**
2. Rellena el cuestionario (app médica, sin contenidos sensibles)
3. Probable resultado: **Para todos los públicos**

---

## Paso 7: Política de privacidad

1. Menú **"Política"** → **"Política de privacidad"**
2. URL: `https://operonte.github.io/releases/horasmedicas/policies/privacy_policy.html`

---

## Paso 8: Zona objetivo y precios

1. **Países:** Elige los países (p. ej. Chile)
2. **Gratuita o de pago:** Gratuita

---

## Paso 9: Subir el AAB

1. Menú **"Producción"** (o **"Pruebas"** si quieres probar antes)
2. **"Crear nueva versión"**
3. Arrastra el archivo `app-release.aab`
4. **Notas de la versión** (ej.): "v1.1.0 - Búsqueda, modo oscuro, mejoras de accesibilidad"
5. **Guardar** y **Revisar versión**

---

## Paso 10: Enviar a revisión

1. Comprueba que todas las tareas obligatorias estén en verde
2. **"Enviar para revisión"**
3. La revisión puede tardar desde varias horas hasta unos días

---

## Resumen de enlaces

- **Play Console:** https://play.google.com/console
- **Documentación Flutter (Android):** https://docs.flutter.dev/deployment/android
- **Política de privacidad:** https://operonte.github.io/releases/horasmedicas/policies/privacy_policy.html

---

## Checklist antes de enviar

- [ ] Keystore creado y guardado en lugar seguro
- [ ] AAB generado con firma de release
- [ ] Ficha de la tienda completa (icono, capturas, descripción)
- [ ] Clasificación de contenido
- [ ] URL de política de privacidad
- [ ] App probada en dispositivo físico
