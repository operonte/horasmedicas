# 🚀 Guía Paso a Paso: Crear Release en GitHub

## 📋 Pasos para Crear el Release

### Paso 1: Compilar la APK

Antes de crear el release, necesitas compilar la APK en modo release:

```bash
flutter build apk --release
```

El archivo APK se generará en: `build/app/outputs/flutter-apk/app-release.apk`

Copia este archivo a la carpeta `release/` con el nombre `horasmedicas-v1.0.0.apk`:

```bash
# Windows PowerShell
Copy-Item build\app\outputs\flutter-apk\app-release.apk release\horasmedicas-v1.0.0.apk
```

### Paso 2: Ir a la Página de Crear Release

1. Abre tu navegador y ve a:
   **https://github.com/operonte/horasmedicas/releases/new**

   O alternativamente:
   - Ve a: https://github.com/operonte/horasmedicas
   - Haz clic en el botón **"Releases"** (en el menú lateral derecho, o en la parte superior)
   - Haz clic en **"Create a new release"** o **"Draft a new release"**

### Paso 3: Completar el Formulario

#### 3.1. Tag Version
- En el campo **"Choose a tag"**, escribe: `v1.0.0`
- Si el tag no existe, GitHub te preguntará si quieres crearlo. Selecciona **"Create new tag: v1.0.0 on publish"**

#### 3.2. Release Title
- En el campo **"Release title"**, escribe: `v1.0.0`

#### 3.3. Description (Notas del Release)
- En el campo **"Describe this release"**, copia y pega el contenido del archivo `RELEASE_NOTES_v1.0.0.md`
- O copia este texto:

```
## Horas Médicas v1.0.0

### 📱 Descarga la APK

Descarga e instala la aplicación directamente en tu dispositivo Android.

### ✨ Características

- ✅ **Acceso directo** a clínicas médicas en Rancagua
- ✅ **Navegación rápida** a sitios web de reserva de horas
- ✅ **Interfaz moderna** y fácil de usar
- ✅ **Lista completa** de clínicas disponibles
- ✅ **Apertura en navegador** externo para mejor experiencia
- ✅ **Diseño Material 3** con Material Design moderno

### 🏥 Clínicas Disponibles

- Clínica MEDS.CL
- Clínica FUSAT
- Clínica ISAMEDICA
- Clínica INTEGRAMEDICA
- Clínica INTERSALUD
- Clínica TORREMEDICA
- Clínica REDSALUD
- Clínica CLEVERSALUD

### 📥 Instalación

1. Descarga el archivo `horasmedicas-v1.0.0.apk`
2. Habilita la instalación desde fuentes desconocidas en tu dispositivo Android
3. Instala la APK
4. ¡Disfruta de la aplicación!

### 🔒 Notas de Seguridad

Esta APK está lista para producción. Asegúrate de descargarla solo desde este repositorio oficial.

### 📄 Política de Privacidad

La política de privacidad está disponible en:
https://operonte.github.io/horasmedicas/privacy_policy.html
```

### Paso 4: Subir el Archivo APK

1. En la sección **"Attach binaries by dropping them here or selecting them"**:
   - **Opción A:** Arrastra y suelta el archivo `release/horasmedicas-v1.0.0.apk`
   - **Opción B:** Haz clic en **"selecting them"** y navega hasta la carpeta `release` y selecciona `horasmedicas-v1.0.0.apk`

2. Espera a que el archivo se suba completamente (verás una barra de progreso)

### Paso 5: Publicar el Release

1. Revisa que todo esté correcto:
   - ✅ Tag: `v1.0.0`
   - ✅ Título: `v1.0.0`
   - ✅ Descripción completa
   - ✅ Archivo APK adjunto

2. Haz clic en el botón **"Publish release"** (botón verde en la parte inferior)

### Paso 6: Verificar que Funciona

1. Una vez publicado, serás redirigido a la página del release
2. Verifica que:
   - El release esté visible
   - El archivo APK esté disponible para descarga
   - La descripción se vea correctamente

3. Prueba el enlace del README:
   - Ve a: https://github.com/operonte/horasmedicas
   - Haz clic en el enlace de descarga en el README
   - Debe llevarte al release que acabas de crear

## ✅ Checklist Final

- [ ] APK compilada en modo release
- [ ] APK copiada a carpeta `release/` con nombre correcto
- [ ] Tag `v1.0.0` creado
- [ ] Release publicado
- [ ] Archivo APK adjunto y descargable
- [ ] Descripción completa y bien formateada
- [ ] Enlace del README funciona correctamente

## 🔗 Enlaces Útiles

- **Crear Release:** https://github.com/operonte/horasmedicas/releases/new
- **Ver Releases:** https://github.com/operonte/horasmedicas/releases
- **Último Release:** https://github.com/operonte/horasmedicas/releases/latest

## 💡 Notas Importantes

- El archivo APK debe estar en la carpeta `release/` del repositorio (opcional, puedes subirlo directamente)
- El nombre del tag debe coincidir con la versión (v1.0.0)
- Una vez publicado, el release no se puede eliminar fácilmente (solo se puede hacer draft)
- El enlace `/releases/latest` siempre apunta al último release publicado
- Para futuros releases, incrementa el número de versión (v1.0.1, v1.1.0, v2.0.0, etc.)

