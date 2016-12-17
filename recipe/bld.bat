:: There is no `gdal-config` on Windows so we need to hardcode gdal's version.
set GDAL_VERSION=2.1.2

"%PYTHON%" setup.py build_ext -I"%LIBRARY_INC%" -lgdal_i -L"%LIBRARY_LIB%" install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1
