#!/bin/bash

$PYTHON -m pip install --no-deps --ignore-installed . \
                       --global-option=build_ext \
                       --global-option="-I$PREFIX/include" \
                       --global-option="-L$PREFIX/lib" \
                       --global-option="-lgdal"
