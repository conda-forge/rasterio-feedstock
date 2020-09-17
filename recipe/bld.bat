:: There is no `gdal-config` on Windows so we need figure it out from gdalinfo
for /F "USEBACKQ tokens=2 delims=, " %%F in (`gdalinfo --version`) do (
set GDAL_VERSION=%%F
)
if errorlevel 1 exit 1
echo "set GDAL_VERSION=%GDAL_VERSION%"

%PYTHON% setup.py build_ext -I"%LIBRARY_INC%" -lgdal_i -L"%LIBRARY_LIB%" install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1
