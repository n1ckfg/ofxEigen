#!/usr/bin/env bash
set -e

# Here we assume that the bootstrap script is in the ADDON_ROOT/scripts directory.
ADDON_ROOT=${ADDON_ROOT:-$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)}

# Run each formula, installing its headers into libs/<formula name>.
BUILD_DIR=$(mktemp -d)
trap 'rm -rf "${BUILD_DIR}"' EXIT

for FORMULA in "${ADDON_ROOT}"/scripts/formulas/*.sh; do
  NAME=$(basename "${FORMULA}" .sh)
  echo "Installing ${NAME} into libs/${NAME} ..."
  (
    source "${FORMULA}"
    cd "${BUILD_DIR}"
    download
    cd "${BUILD_DIR}/${NAME}"
    prepare
    build
    copy "${ADDON_ROOT}/libs/${NAME}"
    clean
  )
done
