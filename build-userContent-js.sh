#/bin/sh

set -e

. ./script/sh/util.sh

# Id: jenkins-userContent/0.0.2-master script/sh/util.sh


id="jenkins-ci.jenkins-usercontent/0.0.2"
out=userContent.js
date=`date`

test -n "$1" || exit 12
build_features="$(echo $(get_properties < $1))"


echo "/* This file is auto-generated by $id: $0 on $date  */" > $out

case " $build_features " in *" doony-js "* )
  echo "/* jshint ignore:start */" >> $out
  cat node_modules/doony/doony.js >> $out
  echo "/* jshint ignore:end */" >> $out
;; esac

case " $build_features " in *" extra-js "* )
  cat extras.js >> $out
;; esac

