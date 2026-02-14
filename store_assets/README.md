# Assets para Google Play Store

## Gráficos (esta carpeta)

| Archivo | Dimensión | Dónde subir en Play Console |
|---------|-----------|-----------------------------|
| `app_icon_512.png` | 512×512 px | Ficha de la tienda → Icono de la aplicación |
| `feature_graphic_1024x500.png` | 1024×500 px | Ficha de la tienda → Gráfico de funciones |

Ya los subiste ✓

---

## Lo que aún debes subir tú

1. **Capturas de pantalla** (mínimo 2 para teléfono)  
   - Ejecuta la app en emulador o dispositivo, haz screenshots y súbelas en **Ficha de la tienda** → **Capturas de pantalla**.

2. **App Bundle (AAB)**  
   - Después de configurar la firma de release (keystore), genera:  
     `flutter build appbundle --release`  
   - El archivo está en: `build/app/outputs/bundle/release/app-release.aab`  
   - Súbelo en **Producción** (o Pruebas) → **Crear nueva versión** → arrastrar el AAB.

No hay ningún otro archivo que tenga que crear el proyecto para Play Store; el resto (categoría, datos de contacto, clasificación, política de privacidad) se completa en la consola.
