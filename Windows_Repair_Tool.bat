@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    echo privilégio de Administrador Confirmado.
) else (
    echo !!Use Privilégio de administrador para usar essa ferramenta!!
    echo Clique com o botão direito do mouse nesse arquivo e selecione 'Executar como Administrador'.
    pause
    exit /b
)
echo Limpando arquivos antigos e liberando espaço...
dism /online /cleanup-image /startcomponentcleanupecho.
echo.
echo Executando DISM - RestoreHealth.
echo Reparando possíveis corrupções na imagem do sistema...
dism /online /cleanup-image /restorehealth
echo.
echo Executando System File Checker.
echo Verificando e reparando arquivos do sistema corrompidos ou ausentes...
sfc /scannow
echo.
echo ######## REPARO COMPLETE ########
pause