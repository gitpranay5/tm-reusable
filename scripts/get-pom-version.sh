# This script is for extracting the version from a Maven POM file.

#!/bin/bash

cd $1 || exit 0
if [ -f $2 ]; then
    POM_VERSION=$( mvn help:evaluate -Dexpression=project.version -q -DforceStdout )
    echo "$POM_VERSION"
else
    echo "No pom.xml found, skipping version extraction"
fi