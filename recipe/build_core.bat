@REM NOTICE: Keep synchronized with build_core.sh

setlocal enableextensions
if errorlevel 1 echo Unable to enable extensions

set BLDDIR=%CD%\build_core

if %errorlevel% neq 0 exit /b %errorlevel%

cmake ^
    -B %BLDDIR% ^
    -S %CD%\src\mcpl_core ^
    %CMAKE_ARGS% ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DMCPL_NOTOUCH_CMAKE_BUILD_TYPE=ON

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --build %BLDDIR% --config Release

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --build %BLDDIR% --target install --config Release

if %errorlevel% neq 0 exit /b %errorlevel%
