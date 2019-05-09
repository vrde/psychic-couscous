#!/bin/bash
# WARNING: the following script has a high concentration of YOLOs

# Note: $HOMEDIR is defined in main.js, check it out

set -e

PLATFORM=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
echo "Settings: platform ${PLATFORM}, architecture ${ARCH}, version ${VERSION}"

VERSION=$(curl -s https://api.github.com/repos/ethereum/go-ethereum/releases/latest | python -c "import sys, json; print(json.load(sys.stdin)['tag_name'])")
echo "Settings: platform ${PLATFORM}, architecture ${ARCH}, version ${VERSION}"
COMMIT=$(curl -s https://api.github.com/repos/ethereum/go-ethereum/commits/${VERSION} | python -c "import sys, json; print(json.load(sys.stdin)['sha'])")
NAME="geth-${PLATFORM}-amd64-${VERSION:1}-${COMMIT:0:8}"
DOWNLOAD_URL="https://gethstore.blob.core.windows.net/builds/${NAME}.tar.gz"
echo "Download ${DOWNLOAD_URL}"
TMP_FILE=$(mktemp)
curl --fail ${DOWNLOAD_URL} | tar -Oxzf - ${NAME}/geth > ${TMP_FILE}
mv ${TMP_FILE} ${HOMEDIR}/geth
chmod +x ${HOMEDIR}/geth
