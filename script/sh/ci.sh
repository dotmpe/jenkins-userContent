#!/bin/sh

set -e

test -n "$report_file" || report_file=build.tap

echo 1..5 > $report_file

# Install and build (bower install and grunt build in postinstall)
npm install \
  && echo "ok 1 package install and build OK" >> $report_file \
  || echo "not ok 1 Error installing package" >> $report_file

#- grunt shell:generateFeatures -env=$ENV --features="bootstrap-css doony-css extra-css doony-js extra-js"

grunt check test \
  && echo "ok 2 Grunt check+test" >> $report_file \
  || echo "not ok 2 Grunt check+test" >> $report_file

test -n "$Update_userContent" && {
  test -w "$HOME/userContent" && {

    {
      cp userContent.{css,js} /var/lib/jenkins/userContent/
      rsync -avzui --delete media/ /var/lib/jenkins/userContent/media
    } && echo "ok 3 userContent synced" >> $report_file \
      || echo "not ok 3 userContent sync failed" >> $report_file

  } || echo "not ok 3 userContent dir not writable"  >> $report_file
} || {
  echo "ok 3 userContent sync # skipped by build option Update_userContent=$Update_userContent"  >> $report_file
}

mkdir -p build/html
rst2html ReadMe.rst build/html/ReadMe.html \
  && echo "ok 4 Docs generated" >> $report_file \
  || echo "not ok 4 Docs generation failed" >> $report_file

echo "ok 5 Build finished" >> $report_file

