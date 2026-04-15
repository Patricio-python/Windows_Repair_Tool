@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    echo privilegio de Administrador Confirmado.
) else (
    echo !!Use Privilegio de administrador para usar essa ferramenta!!
    echo Clique com o botao direito do mouse nesse arquivo e selecione 'Executar como Administrador'.
    pause
    exit /b
)
echo Limpando arquivos antigos e liberando espaço...
dism /online /cleanup-image /startcomponentcleanupecho.
echo.
echo Executando DISM - RestoreHealth.
echo Reparando possiveis corrupcoes na imagem do sistema...
dism /online /cleanup-image /restorehealth
echo.
echo Executando System File Checker.
echo Verificando e reparando arquivos do sistema corrompidos ou ausentes...
sfc /scannow
echo.
echo ######## REPARO COMPLETO ########
pause
