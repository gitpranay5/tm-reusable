# This script is for bumping the version in a Maven POM file.

#!/bin/bash

cd java || exit 0
echo " Current version is: $CURRENT_VERSION "
NEW_VERSION=$(echo "$CURRENT_VERSION" | grep -Eo '^[0-9]+\.[0-9]+\.[0-9]+' | awk -F. '{ OFS=".";
        major=$1; minor=$2; patch=$3;
        if (patch < 9) {
            patch++;
        } else if (minor < 9) {
            minor++; patch=0;
        } else {
            major++; minor=0; patch=0;
        }
        print major, minor, patch
    }')
echo "$NEW_VERSION"
