# Requisitos y Configuración para Stores

Este documento resume las configuraciones realizadas y las recomendaciones adicionales para publicar la app en las stores.

## ✅ Configuraciones Completadas

### 1. Política de Privacidad
- ✅ Creado `privacy_policy.html` con política completa
- ✅ Disponible en el repositorio: `privacy_policy.html`
- ✅ URL para stores: `https://raw.githubusercontent.com/operonte/horasmedicas/main/privacy_policy.html`
- 📝 **Nota**: Esta URL raw de GitHub es válida para usar en las stores (es HTTPS y accesible públicamente)

### 2. Android (Google Play Store)

#### Permisos Configurados:
- ✅ `INTERNET` - Necesario para abrir URLs
- ✅ Queries para `https` y `http` (Android 11+)
- ✅ Nombre de la app actualizado: "Horas Médicas"

#### Archivos Modificados:
- `android/app/src/main/AndroidManifest.xml`

#### ⚠️ Acciones Requeridas ANTES de Publicar:

1. **Application ID Único**:
   - Actualmente: `com.example.horasmedicas`
   - **Debes cambiar** en `android/app/build.gradle.kts`:
     ```kotlin
     applicationId = "com.tudominio.horasmedicas"  // Cambiar por tu dominio único
     namespace = "com.tudominio.horasmedicas"     // Cambiar también
     ```

2. **Firma de la Aplicación**:
   - Actualmente usa debug keys (NO válido para producción)
   - Debes crear un keystore y configurar la firma en `android/app/build.gradle.kts`
   - Ver: https://docs.flutter.dev/deployment/android#signing-the-app

3. **Icono de la Aplicación**:
   - Asegúrate de tener iconos en todas las resoluciones
   - Ubicación: `android/app/src/main/res/mipmap-*/ic_launcher.png`

4. **Screenshots y Assets**:
   - Prepara screenshots para diferentes tamaños de pantalla
   - Descripción corta (80 caracteres)
   - Descripción completa
   - Categoría: Salud/Medicina

### 3. iOS (App Store)

#### Configuraciones Realizadas:
- ✅ `LSApplicationQueriesSchemes` para `https` y `http`
- ✅ `NSAppTransportSecurity` configurado correctamente
- ✅ Nombre de la app: "Horas Médicas"

#### Archivos Modificados:
- `ios/Runner/Info.plist`

#### ⚠️ Acciones Requeridas ANTES de Publicar:

1. **Bundle Identifier Único**:
   - Actualmente: `com.example.horasmedicas`
   - **Debes cambiar** en Xcode o en `ios/Runner.xcodeproj/project.pbxproj`
   - Formato recomendado: `com.tudominio.horasmedicas`
   - Debe estar registrado en tu cuenta de Apple Developer

2. **Certificados y Provisioning Profiles**:
   - Necesitas una cuenta de Apple Developer ($99/año)
   - Crear certificados de distribución
   - Crear provisioning profiles

3. **Iconos y Assets**:
   - Icono de la app (1024x1024)
   - Screenshots para diferentes dispositivos (iPhone, iPad)
   - Ver: https://developer.apple.com/app-store/review/guidelines/

4. **App Store Connect**:
   - Crear la app en App Store Connect
   - Completar información de la app
   - Subir build usando Xcode o `flutter build ipa`

### 4. Microsoft Store (Windows)

#### Configuraciones Realizadas:
- ✅ Manifest básico configurado
- ✅ Compatibilidad con Windows 10 y 11

#### Archivos:
- `windows/runner/runner.exe.manifest`

#### ⚠️ Acciones Requeridas ANTES de Publicar:

1. **Package Identity**:
   - Configurar en `windows/runner/Runner.rc`
   - Necesitas un nombre único para el paquete

2. **Certificado de Firma**:
   - Crear certificado para firmar la app
   - Ver: https://docs.flutter.dev/deployment/windows

3. **Microsoft Store**:
   - Crear cuenta de desarrollador
   - Crear la app en Partner Center
   - Subir el paquete .msix

### 5. macOS (Mac App Store)

#### Configuraciones Realizadas:
- ✅ `LSApplicationQueriesSchemes` para `https` y `http`
- ✅ `NSAppTransportSecurity` configurado

#### Archivos Modificados:
- `macos/Runner/Info.plist`

#### ⚠️ Acciones Requeridas:
- Similar a iOS, necesitas cuenta de Apple Developer
- Bundle identifier único
- Certificados y provisioning profiles

## 📋 Checklist Pre-Publicación

### General
- [ ] Cambiar `com.example.horasmedicas` por un ID único en todas las plataformas
- [ ] Publicar `privacy_policy.html` en un sitio web accesible
- [ ] Actualizar README.md con la URL de la política de privacidad
- [ ] Preparar screenshots de la app
- [ ] Preparar descripciones para las stores
- [ ] Crear iconos de alta calidad para todas las plataformas

### Android
- [ ] Crear keystore y configurar firma
- [ ] Cambiar applicationId en `build.gradle.kts`
- [ ] Probar la app en diferentes dispositivos
- [ ] Crear cuenta de Google Play Developer ($25 una vez)
- [ ] Preparar assets (iconos, screenshots, descripción)

### iOS
- [ ] Crear cuenta de Apple Developer ($99/año)
- [ ] Cambiar bundle identifier
- [ ] Configurar certificados y provisioning profiles
- [ ] Probar en dispositivos físicos
- [ ] Preparar assets para App Store

### Windows
- [ ] Crear cuenta de Microsoft Partner Center
- [ ] Configurar package identity
- [ ] Crear certificado de firma
- [ ] Probar en Windows 10 y 11

## 🔗 Enlaces Útiles

- **Flutter Deployment**: https://docs.flutter.dev/deployment
- **Google Play**: https://developer.android.com/distribute
- **Apple App Store**: https://developer.apple.com/app-store/
- **Microsoft Store**: https://docs.microsoft.com/en-us/windows/msix/

## 📝 Notas Importantes

1. **Application ID / Bundle Identifier**: 
   - Debe ser único y no puede cambiarse después de publicar
   - Usa formato inverso de dominio: `com.tudominio.horasmedicas`

2. **Política de Privacidad**:
   - Es obligatoria en todas las stores
   - Debe estar accesible públicamente
   - Debe ser una URL HTTPS

3. **Firma de Aplicaciones**:
   - Android: Keystore (guárdalo de forma segura, no se puede recuperar)
   - iOS: Certificados de Apple Developer
   - Windows: Certificado de código

4. **Versión**:
   - Actual: `1.0.0+1` en `pubspec.yaml`
   - Incrementa el número de versión para cada release

