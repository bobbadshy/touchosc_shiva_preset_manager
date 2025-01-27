#!/bin/bash

# read config
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/config.sh"

echo -e "\n == Copying to repo main dir at $REPO ==\n"

cp -av "$TOSC_BUILD" "$TOSC_FINAL"

echo -e "\nDone.\n"
