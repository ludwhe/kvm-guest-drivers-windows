@echo off
if not "%VSFLAVOR%"=="" goto :knownVS
call :checkvs
echo USING %VSFLAVOR% Visual Studio

:knownVS
echo %0: Setting NATIVE ENV for %1 (VS %VSFLAVOR%)...
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\%VSFLAVOR%\VC\Auxiliary\Build\vcvarsall.bat" %1
goto :eof

:checkvs
set VSFLAVOR=Professional
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" set VSFLAVOR=Community
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" set VSFLAVOR=Enterprise
goto :eof
