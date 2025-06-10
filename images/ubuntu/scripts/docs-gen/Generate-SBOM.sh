#!/bin/bash -e
################################################################################
##  File:  Generate-SBOM.sh
##  Desc:  Create SBOM for the release
################################################################################

# Assign script parameters to variables
OutputDirectory="$1"

# Install sysft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Generating SBOM 
syft dir:/ -o spdx-json=$OutputDirectory/sbom.json

# Preparing artifact (raw SBOM.json is too big)
cd $OutputDirectory
zip -r sbom.json.zip sbom.json
