@echo off
setlocal EnableExtensions
title XDAT Editor - L2JA.L.N
cd /d "%~dp0"

if not exist "bin\editor.bat" (
	echo [ERRO] Falta bin\editor.bat. Gera de novo com gerar-distribuicao-L2JA.LN.bat nesta pasta xdat_editor.
	pause
	exit /b 1
)

set "JDK8="
if exist "C:\Program Files\Zulu\zulu-8\bin\java.exe" set "JDK8=C:\Program Files\Zulu\zulu-8"
if not defined JDK8 if exist "C:\Program Files\BellSoft\LibericaJDK-8\bin\java.exe" set "JDK8=C:\Program Files\BellSoft\LibericaJDK-8"
if not defined JDK8 if exist "C:\Program Files\Eclipse Adoptium\jdk-8.0.482.8-hotspot\bin\java.exe" set "JDK8=C:\Program Files\Eclipse Adoptium\jdk-8.0.482.8-hotspot"

if not defined JDK8 (
	echo [ERRO] Nao achei JDK 8 com JavaFX. Instala: winget install Azul.ZuluFX.8.JDK
	pause
	exit /b 1
)

set "JAVA_HOME=%JDK8%"
set "PATH=%JDK8%\bin;%PATH%"
call "%~dp0bin\editor.bat" %*
set "ERR=%ERRORLEVEL%"
endlocal & exit /b %ERR%
