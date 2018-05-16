:: There is no `gdal-config` on Windows so we need to hardcode gdal's version.
set GDAL_VERSION=2.2.3

"%PYTHON%" -m pip install --no-deps --ignore-installed . ^
                          --global-option=build_ext ^
                          --global-option="-I%LIBRARY_INC%" ^
                          --global-option="-L%LIBRARY_LIB%" ^
                          --global-option="-lgdal_i"
if errorlevel 1 exit 1
