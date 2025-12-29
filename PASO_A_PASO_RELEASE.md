# 📱 Paso a Paso: Crear Release de Horas Médicas

## Paso 1: Compilar la APK en Modo Release

Abre PowerShell o Terminal en la carpeta del proyecto y ejecuta:

```bash
flutter build apk --release
```

**⏱️ Tiempo estimado:** 2-5 minutos

**✅ Verificación:** Al finalizar, deberías ver un mensaje como:
```
✓ Built build\app\outputs\flutter-apk\app-release.apk
```

El archivo APK estará en: `build\app\outputs\flutter-apk\app-release.apk`

---

## Paso 2: Renombrar y Copiar el APK (Opcional)

Si quieres tener el APK con un nombre específico en la carpeta `release/`:

```powershell
# Windows PowerShell
Copy-Item build\app\outputs\flutter-apk\app-release.apk release\horasmedicas-v1.0.0.apk
```

**Nota:** No es obligatorio, puedes subir el APK directamente desde `build\app\outputs\flutter-apk\app-release.apk`

---

## Paso 3: Ir a la Página de Crear Release en GitHub

1. Abre tu navegador
2. Ve a esta URL:
   ```
   https://github.com/operonte/horasmedicas/releases/new
   ```

   **O alternativamente:**
   - Ve a: https://github.com/operonte/horasmedicas
   - Haz clic en **"Releases"** (en el menú lateral derecho o en la parte superior)
   - Haz clic en **"Create a new release"** o **"Draft a new release"**

---

## Paso 4: Crear el Tag

1. En el campo **"Choose a tag"**, escribe:
   ```
   v1.0.0
   ```

2. Si el tag no existe, GitHub mostrará un mensaje. Selecciona:
   ```
   Create new tag: v1.0.0 on publish
   ```

---

## Paso 5: Completar el Título del Release

En el campo **"Release title"**, escribe:
```
v1.0.0
```

---

## Paso 6: Agregar la Descripción

En el campo **"Describe this release"**, copia y pega este texto:

```markdown
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

---

## Paso 7: Subir el Archivo APK

1. En la sección **"Attach binaries by dropping them here or selecting them"**:

   **Opción A - Arrastrar y Soltar:**
   - Abre el Explorador de Archivos de Windows
   - Navega a: `C:\LAB\app\flutter\horasmedicas\build\app\outputs\flutter-apk\`
   - Arrastra el archivo `app-release.apk` a la zona de "Attach binaries"

   **Opción B - Seleccionar Archivo:**
   - Haz clic en **"selecting them"**
   - Navega a: `build\app\outputs\flutter-apk\app-release.apk`
   - Selecciona el archivo

2. ⏳ Espera a que el archivo se suba completamente (verás una barra de progreso y luego el nombre del archivo)

---

## Paso 8: Revisar Antes de Publicar

Verifica que todo esté correcto:

- ✅ **Tag:** `v1.0.0`
- ✅ **Título:** `v1.0.0`
- ✅ **Descripción:** Completa y bien formateada
- ✅ **Archivo APK:** Adjunto y visible

---

## Paso 9: Publicar el Release

1. Haz clic en el botón verde **"Publish release"** (en la parte inferior de la página)

2. ⏳ Espera unos segundos mientras GitHub procesa el release

3. Serás redirigido automáticamente a la página del release publicado

---

## Paso 10: Verificar que Funciona

1. **Verifica el Release:**
   - El release debe estar visible en: https://github.com/operonte/horasmedicas/releases
   - El archivo APK debe estar disponible para descarga
   - La descripción debe verse correctamente con formato

2. **Prueba el Enlace del README:**
   - Ve a: https://github.com/operonte/horasmedicas
   - Haz clic en el enlace **"⬇️ Descargar APK (Última Versión)"** en el README
   - Debe llevarte al release que acabas de crear

3. **Prueba la Descarga:**
   - Haz clic en el archivo APK en la página del release
   - Debe iniciar la descarga

---

## ✅ Checklist Final

- [ ] APK compilada exitosamente
- [ ] Tag `v1.0.0` creado
- [ ] Release publicado
- [ ] Archivo APK adjunto y descargable
- [ ] Descripción completa y bien formateada
- [ ] Enlace del README funciona correctamente
- [ ] Descarga del APK funciona

---

## 🔗 Enlaces Útiles

- **Crear Release:** https://github.com/operonte/horasmedicas/releases/new
- **Ver Releases:** https://github.com/operonte/horasmedicas/releases
- **Último Release:** https://github.com/operonte/horasmedicas/releases/latest
- **Política de Privacidad:** https://operonte.github.io/horasmedicas/privacy_policy.html

---

## 💡 Notas Importantes

- El archivo APK puede tener cualquier nombre al subirlo, GitHub lo mostrará como está
- El nombre del tag debe coincidir con la versión (v1.0.0)
- Una vez publicado, el release no se puede eliminar fácilmente (solo se puede hacer draft)
- El enlace `/releases/latest` siempre apunta al último release publicado
- Para futuros releases, incrementa el número de versión (v1.0.1, v1.1.0, v2.0.0, etc.)

---

## 🆘 Solución de Problemas

### Si la compilación falla:
- Verifica que Flutter esté actualizado: `flutter doctor`
- Asegúrate de estar en la carpeta correcta del proyecto
- Revisa que no haya errores en el código: `flutter analyze`

### Si no puedes subir el APK:
- Verifica que el archivo no esté abierto en otro programa
- Asegúrate de que el archivo sea menor a 100MB (GitHub tiene límites)
- Intenta con un navegador diferente

### Si el release no aparece:
- Espera unos minutos, a veces GitHub tarda en procesar
- Refresca la página
- Verifica que hayas hecho clic en "Publish release" y no solo guardado como draft

