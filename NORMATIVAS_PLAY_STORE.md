# Verificación de normativas - Google Play Store

## Estado de la app Horas Médicas

---

## Requisitos técnicos (App)

| Requisito | Estado | Notas |
|-----------|--------|------|
| **targetSdk ≥ 34** | ✅ | Flutter usa 34 por defecto (Android 14) |
| **applicationId único** | ✅ | com.operonte.horasmedicas |
| **Solo permiso INTERNET** | ✅ | Declarado en manifest |
| **usesCleartextTraffic=false** | ✅ | Solo HTTPS |
| **Política de privacidad** | ✅ | URL pública y accesible |

---

## Lo que debes declarar en Play Console

### 1. Seguridad de los datos (Data Safety)

**Importante:** Google exige declarar el tratamiento de datos.

Como Horas Médicas **NO recopila datos**, debes indicar:

- **"No se recopilan ni comparten datos"** (o equivalente)
- O responder "No" a todas las preguntas sobre recopilación

En Play Console: **Política** → **Seguridad de los datos** → Declarar que no recopilas datos personales.

---

### 2. Política de privacidad

- **URL:** `https://operonte.github.io/releases/horasmedicas/policies/privacy_policy.html`
- Debe estar accesible públicamente (sin login)
- Ya publicada y funcionando

---

### 3. Clasificación de contenido

Para Horas Médicas (app médica/salud, solo enlaces):

- Contenido: información de salud
- No tiene: compras, anuncios, ubicación, datos personales
- Resultado esperado: **Para todos los públicos** o **PEGI 3**

Responde el cuestionario con sinceridad.

---

### 4. Ficha de la tienda (Store Listing)

| Campo | Ejemplo sugerido |
|-------|------------------|
| **Nombre** | Horas Médicas |
| **Descripción breve** (80 caracteres máx) | Acceso rápido a clínicas médicas en Rancagua para reservar horas |
| **Descripción completa** | Ver texto en RECURSOS_STORE abajo |
| **Icono** | 512×512 px (usar assets/app_icon_1024.png redimensionado) |
| **Capturas** | Mínimo 2 (teléfono), recomendado 4–8 |

---

### 5. Firma de la app (requisito crítico)

La app actual usa **firma de debug**. Para Play Store necesitas **firma de release**:

- Crear keystore (firma de subida)
- Configurar `key.properties` y `build.gradle.kts`
- Ver `GUIA_PLAY_STORE.md` para los pasos

Sin esto, **Google no aceptará el AAB/APK**.

---

## Checklist antes de enviar

- [ ] Keystore creado y configurado
- [ ] AAB generado con firma de release: `flutter build appbundle --release`
- [ ] Data Safety declarado como "sin recopilación de datos"
- [ ] URL de política de privacidad añadida
- [ ] Clasificación de contenido completada
- [ ] Ficha con descripción, icono y capturas
- [ ] App probada en dispositivo físico

---

## Recursos para la ficha de la tienda

### Descripción corta (80 caracteres)

```
Acceso rápido a clínicas médicas en Rancagua para reservar horas
```

### Descripción larga (4000 caracteres máx)

```
Horas Médicas te permite acceder de forma rápida a las páginas web de las principales clínicas médicas en Rancagua, Chile.

CARACTERÍSTICAS:
• 8 clínicas médicas disponibles
• Búsqueda para encontrar tu clínica rápidamente
• Un toque abre el sitio web en tu navegador
• Modo oscuro automático
• Sin anuncios, sin suscripciones

CLÍNICAS INCLUIDAS:
MEDS.CL, FUSAT, ISAMEDICA, INTEGRAMEDICA, INTERSALUD, TORREMEDICA, REDSALUD y CLEVERSALUD.

La app no recopila datos personales. Simplemente te facilita el acceso a los sitios web de reserva de cada clínica.

Ideal para quienes necesitan agendar horas médicas en Rancagua de forma sencilla.
```

---

## Enlaces de referencia

- [Requisitos de Google Play](https://support.google.com/googleplay/android-developer/answer/10788890)
- [Seguridad de los datos](https://support.google.com/googleplay/android-developer/answer/10787469)
- [Niveles de API](https://developer.android.com/google/play/requirements/target-sdk)
