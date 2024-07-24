Rem Written by FalsePhilosopher
Echo off
 
set isodir=.\%PWD%

set converter=.\gcit.exe
 
if NOT exist "%isodir%" (
  echo "ERROR directory doesn't exist"
  goto :EOF
)
 
 
FOR /F "tokens=1 delims=." %%A IN ('dir /b "%isodir%"') DO (
  echo converting: %%A
  "%converter%" "%isodir%\%%A.iso" -b -d "%isodir%\converted\%%A.iso" -AQ
)
