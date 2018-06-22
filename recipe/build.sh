#!/bin/bash
$R CMD INSTALL --build .
# This rpath interferes with my attempt at allowing symbolic-link based interposition of Rblas.
if [[ ${target_platform} == osx-64 ]]; then
  ${INSTALL_NAME_TOOL} -delete_rpath ${PREFIX}/lib ${PREFIX}/lib/R/library/slam/libs/slam.so
fi
