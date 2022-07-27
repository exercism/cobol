#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/
SLUG=${1:-$(basename "${SCRIPT_DIR}")}

if [ ! -f $SCRIPT_DIR/bin/cobolcheck ]; then
    echo "Cobolcheck not found, try to fetch it."
    cd $SCRIPT_DIR/bin/
    bash fetch-cobolcheck
fi
cd $SCRIPT_DIR
./bin/cobolcheck -p $SLUG

# compile and run
cobc -xj test.cob
