@REM NOTICE: Keep synchronized with test_core.sh

setlocal enableextensions
if errorlevel 1 echo Unable to enable extensions

mcpl-config --help

if %errorlevel% neq 0 exit /b %errorlevel%

mcpl-config -s

if %errorlevel% neq 0 exit /b %errorlevel%

cmake --find-package -DNAME=MCPL -DCOMPILER_ID=GNU -DLANGUAGE=CXX -DMODE=EXIST

if %errorlevel% neq 0 exit /b %errorlevel%

@REM fixme test files from mcpl-config --show libpath/shlibpath/includedir exist
@REM fixme downstream cmake?
