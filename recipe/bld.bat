:: There is no `gdal-config` on Windows so we need to hardcode gdal's version.
set GDAL_VERSION=2.4.1

REM For some reason pip is failing
REM See https://circleci.com/gh/conda-forge/rasterio-feedstock/474?utm_campaign=vcs-integration-link&utm_medium=referral&utm_source=github-build-link
:: "%PYTHON%" -m pip install --no-deps --ignore-installed . ^
::                           --global-option=build_ext ^
::                           --global-option="-I%LIBRARY_INC%" ^
::                           --global-option="-L%LIBRARY_LIB%" ^
::                           --global-option="-lgdal_i"
:: if errorlevel 1 exit 1


"%PYTHON%" setup.py build_ext -I"%LIBRARY_INC%" -lgdal_i -L"%LIBRARY_LIB%" install --single-version-externally-managed --record record.txt
if errorlevel 1 exit 1
