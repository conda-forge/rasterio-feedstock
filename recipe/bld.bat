:: There is no `gdal-config` on Windows so we need to hardcode gdal's version.
set GDAL_VERSION=2.4.3

REM "%PYTHON%" -m pip install --no-deps --ignore-installed . ^
REM                           --global-option=build_ext ^
REM                           --global-option="-I%LIBRARY_INC%" ^
REM                           --global-option="-L%LIBRARY_LIB%" ^
REM                           --global-option="-lgdal_i" -vv
%PYTHON% setup.py install --single-version-externally-managed --record record.txt ^
                          -I%LIBRARY_INC% -L%LIBRARY_LIB% -lgdal_i
if errorlevel 1 exit 1
