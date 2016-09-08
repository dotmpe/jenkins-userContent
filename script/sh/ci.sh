#!/bin/sh

set -e

test -n "$report_file" || report_file=build.tap

echo 1..5 > build.tap

# Install and build (bower install and grunt build in postinstall)
npm install \
  && echo "ok 1 - local install OK" >> build.tap \
  || echo "not ok 1 - Error installing" >> build.tap

#- grunt shell:generateFeatures -env=$ENV --features="bootstrap-css doony-css extra-css doony-js extra-js"

grunt check test
echo "ok 2 - Grunt check+test OK" >> build.tap

- test -w "$HOME/userContent" && { cp -v userContent.{css,js} $HOME/userContent/; } || echo "Note userContent is not writable, no files installed"

cp userContent.{{css,js}} /var/lib/jenkins/userContent/
rsync -avzui --delete media/ /var/lib/jenkins/userContent/media
echo "ok 3 - userContent installed" >> build.tap

mkdir -p build/html
rst2html ReadMe.rst build/html/ReadMe.html
echo "ok 4 - Docs generated" >> build.tap

echo "ok 5 - Build finished" >> build.tap

