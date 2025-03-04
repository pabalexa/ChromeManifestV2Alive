# Script para mantener el soporte de Manifest v2 en Google Chrome

Este repositorio contiene un script para modificar el registro de Windows y permitir el soporte de **Manifest v2** en Google Chrome, incluso después de que Google haya comenzado a descontinuarlo a favor de **Manifest v3**. Esto es útil si deseas seguir utilizando extensiones que aún no han sido actualizadas a Manifest v3.

## ¿Qué es Manifest v2 y v3?

- **Manifest v2** es la versión actual del formato que utiliza Google Chrome para gestionar las extensiones.
- **Manifest v3** es la nueva versión que está siendo implementada gradualmente por Google Chrome, y muchas extensiones todavía no se han actualizado para ser compatibles con esta versión.

La transición a Manifest v3 traerá cambios significativos en cómo las extensiones funcionan, lo que puede hacer que algunas extensiones populares dejen de funcionar si no se actualizan.

## ¿Qué hace este script?

Este script agrega o modifica una clave en el registro de Windows para **permitir el soporte de Manifest v2 en Google Chrome hasta al menos junio de 2025**. Al ejecutar este script, se garantiza que las extensiones basadas en Manifest v2 sigan funcionando, a pesar de las actualizaciones de Chrome que deshabilitarían el soporte para ellas.

### Comando que ejecuta el script:

```bash
reg add HKLM\Software\Policies\Google\Chrome /v ExtensionManifestV2Availability /t REG_DWORD /d 2 /f
```

### Explicación del comando

- **`reg add`**: Este comando agrega o modifica una clave en el registro de Windows.
- **`HKLM\Software\Policies\Google\Chrome`**: Especifica la ruta en el registro de Windows donde se aplicará la política, que en este caso está dirigida a Google Chrome.
- **`/v ExtensionManifestV2Availability`**: Crea o modifica un valor denominado `ExtensionManifestV2Availability`, que controla la disponibilidad de Manifest v2.
- **`/t REG_DWORD`**: Define que el valor será un número entero (32 bits).
- **`/d 2`**: Asigna el valor `2` a la clave, lo que permite el soporte de Manifest v2.
- **`/f`**: Forza la operación sin pedir confirmación, incluso si la clave ya existe.

### ¿Por qué usar este script?

- Si eres usuario de extensiones que no se han actualizado a Manifest v3, como algunas versiones de **The Great Suspender**, este script te permitirá seguir usándolas sin problemas.
- Ayuda a evitar la pérdida de funcionalidad cuando Google Chrome finalmente deje de soportar Manifest v2.
- Es una solución temporal hasta que los desarrolladores actualicen sus extensiones a la nueva versión.

### Desventajas

- **Gestión de la organización**: Al aplicar esta política, tu navegador puede mostrar el mensaje **"Este navegador está gestionado por tu organización"**, ya que el cambio en el registro se aplica a nivel del sistema.
- **Solución temporal**: Ten en cuenta que este cambio es una solución temporal y solo funcionará hasta que Google implemente cambios más permanentes en Chrome para deshabilitar Manifest v2 completamente.

## ¿Cómo usar el script?

1. **Descargar o clonar el repositorio**.

   Si prefieres descargar el archivo directamente, haz clic en **Download ZIP** o clona el repositorio utilizando Git:

   ```bash
   git clone https://github.com/pabalexa/ChromeManifestV2Alive.git
   ```

2. **Ejecutar el script en tu sistema**.

   El script se puede ejecutar desde la terminal de **CMD** o **PowerShell** de Windows. Sigue estos pasos:

   - Abre una ventana de **CMD** o **PowerShell** como **Administrador**.
   - Navega a la carpeta donde descargaste o clonaste el script.
   - Ejecuta el script. Si estás utilizando el archivo `.bat`, simplemente haz doble clic para ejecutarlo.

   También puedes ejecutar el siguiente comando manualmente en tu terminal si lo prefieres:

   ```bash
   reg add HKLM\Software\Policies\Google\Chrome /v ExtensionManifestV2Availability /t REG_DWORD /d 2 /f
   ```

3. **Verifica que funciona**.

   Abre **Chrome** y ve a la siguiente URL:

   ```
   chrome://policy
   ```

   Recarga las políticas y busca `ExtensionManifestV2Availability`. Debería estar establecido en `2`. Si ves esto, ¡el cambio se aplicó correctamente!

---

**Aviso:** Este script es para **uso personal y experimental**. Usa el script bajo tu propio riesgo. No somos responsables de ningún daño o pérdida de datos que pueda ocurrir al modificar el registro de tu sistema.
