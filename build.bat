@ECHO OFF

REM The location of the source code
SET "SRC=src"

REM The location of the output directory
SET "OUT=bin"

REM The name of the binary
SET "BIN=pony-gl"

REM Clean up the output directory
FOR %%i IN (%OUT%\*) DO IF NOT %%i == %OUT%\.gitignore DEL /Q %%i

ECHO.
ECHO Building Pony-GL ...
ECHO.

CD %SRC%

ponyc -d -p %SRC% -o ..\%OUT% -b %BIN%

CD ..\

REM Get the last exit code and stop the batch script when there's an error
IF %ERRORLEVEL% NEQ 0 (
    GOTO :EOF
)

REM Copy the GLFW DLL to the output directory
XCOPY /Y /E %SRC%\glfw\glfw3.dll %OUT% 1>NUL

ECHO.

%OUT%\%BIN%

EXIT /B 0