#!/bin/bash

# For some reason pip is failing
# See https://circleci.com/gh/conda-forge/rasterio-feedstock/474?utm_campaign=vcs-integration-link&utm_medium=referral&utm_source=github-build-link
# $PYTHON -m pip install --no-deps --ignore-installed . \
#                        --global-option=build_ext \
#                        --global-option="-I$PREFIX/include" \
#                        --global-option="-L$PREFIX/lib" \
#                        --global-option="-lgdal"

$PYTHON setup.py build_ext -I$PREFIX/include -L$PREFIX/lib -lgdal install --single-version-externally-managed --record record.txt