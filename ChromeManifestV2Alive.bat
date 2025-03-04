@echo off
:: Este script agrega una clave en el registro de Windows para habilitar el soporte de Manifest v2 en Google Chrome

:: Verifica si el script se está ejecutando como administrador
:: Si no, lo vuelve a ejecutar como administrador
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Este script necesita privilegios de administrador. Reiniciando...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

:: Agrega o modifica la clave en el registro de Windows
:: La ruta especificada es para las políticas de Google Chrome en el registro
reg add "HKLM\Software\Policies\Google\Chrome" /v ExtensionManifestV2Availability /t REG_DWORD /d 2 /f

:: Explicación del comando:
:: reg add: Agrega una nueva clave o valor en el registro
:: "HKLM\Software\Policies\Google\Chrome": Ruta del registro donde se agregará la política
:: /v ExtensionManifestV2Availability: El nombre del valor que se agregará/modificará
:: /t REG_DWORD: Define el tipo de dato como un número entero de 32 bits (DWORD)
:: /d 2: El valor de la clave, donde 2 habilita el soporte para Manifest v2
:: /f: Fuerza la modificación del registro sin pedir confirmación

:: Informa al usuario que la operación fue exitosa
echo La clave de registro ha sido agregada correctamente.
echo Puedes verificar el cambio en chrome://policy.

:: Pausa el script para que el usuario vea el mensaje antes de que la ventana se cierre
pause
