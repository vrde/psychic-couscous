#!/bin/bash
# WARNING: the following script has a high concentration of YOLOs

# Note: $HOMEDIR is defined in main.js, check it out

set -e

VERSION="1.8.27"
COMMIT="4bcc0a37"
PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
NAME="geth-${PLATFORM}-amd64-${VERSION}-${COMMIT}"
DOWNLOAD_URL="https://gethstore.blob.core.windows.net/builds/${NAME}.tar.gz"
TMP_FILE=$(mktemp)

echo "Downloading ${DOWNLOAD_URL}"
curl --fail ${DOWNLOAD_URL} | tar -Oxzf - ${NAME}/geth > ${TMP_FILE}
mv ${TMP_FILE} ${HOMEDIR}/geth
chmod +x ${HOMEDIR}/geth
