# This script is for extracting the version from a Maven POM file.

#!/bin/bash

cd java || exit 0
if [ -f pom.xml ]; then
POM_VERSION=$( mvn help:evaluate -Dexpression=project.version -q -DforceStdout )
echo "Current version is $POM_VERSION"
echo "VERSION=$POM_VERSION" >> $GITHUB_OUTPUT
else
echo "No pom.xml found, skipping version extraction"
fi