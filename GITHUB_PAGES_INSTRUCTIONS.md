# Instrucciones para Publicar la Política de Privacidad en GitHub Pages

## Pasos para activar GitHub Pages y ver la política en modo vista

### 1. Activar GitHub Pages en tu repositorio

1. Ve a tu repositorio en GitHub: https://github.com/operonte/horasmedicas
2. Haz clic en **"Settings"** (Configuración) en la parte superior del repositorio
3. En el menú lateral izquierdo, busca y haz clic en **"Pages"**
4. En la sección **"Source"**, selecciona:
   - **Branch**: `main`
   - **Folder**: `/ (root)`
5. Haz clic en **"Save"**
6. Espera 1-2 minutos para que GitHub procese la configuración

### 2. URL de tu política de privacidad

Una vez activado GitHub Pages, tu política de privacidad estará disponible en:

**URL de GitHub Pages:**
```
https://operonte.github.io/horasmedicas/privacy_policy.html
```

Esta URL mostrará el HTML renderizado (modo vista) en lugar del código fuente.

### 3. Verificar que funciona

1. Espera unos minutos después de activar GitHub Pages
2. Visita: https://operonte.github.io/horasmedicas/privacy_policy.html
3. Deberías ver la política de privacidad renderizada con todos los estilos

### 4. Actualizar referencias

Una vez que tengas la URL de GitHub Pages funcionando, puedes usarla en:
- README.md (ya está actualizado)
- REQUISITOS_STORES.md (para las stores)
- Cualquier otra documentación

## Notas importantes

- El repositorio debe ser **público** para usar GitHub Pages gratis
- La URL será permanente una vez configurada
- Puedes actualizar el HTML cuando quieras, solo haz commit y push
- Los cambios pueden tardar unos minutos en reflejarse en GitHub Pages

## Solución de problemas

### Si GitHub Pages no se activa:
- Verifica que el repositorio sea público
- Asegúrate de que el archivo `privacy_policy.html` esté en la raíz del repositorio
- Espera unos minutos más, a veces tarda en procesarse

### Si la página muestra código en lugar de HTML renderizado:
- Verifica que GitHub Pages esté activado correctamente
- Asegúrate de usar la URL de GitHub Pages (`operonte.github.io`) y no la URL raw

