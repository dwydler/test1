#!/bin/bash -e
################################################################################
##  File:  Generate-SBOM.sh
##  Desc:  Create SBOM for the release
################################################################################

# Source the helpers for use with the script
#source $HELPER_SCRIPTS/install.sh

# Install sysft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Generating SBOM 
syft dir:/ -v -o spdx-json=sbom.json

# Preparing artifact (raw SBOM.json is too big)
zip sbom.json.zip sbom.json
