REM Written by FalsePhilosopher
Echo off

set isodir=.\%PWD%

set converter=.\gcit.exe

if NOT exist "%isodir%" (
  echo "ERROR directory doesn't exist"
  goto :EOF
)


FOR /F "tokens=1 delims=." %%A IN ('dir /b "%isodir%*.iso"') DO (
  echo converting: %%A
  "%converter%" "%isodir%\%%A.iso" -b -d "%isodir%\Trimmed\%%A.iso" -AQ
)
