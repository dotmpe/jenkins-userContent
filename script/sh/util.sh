#/bin/sh

set -e

# Id: jenkins-userContent/0.0.4-dev script/sh/util.sh


get_properties()
{
  grep -v '^\ *#' | \
    grep -i '[:=]\ *\(true\|1\|yes\|on\|ok\)\ *$' | \
    sed 's/\ *[:=]\{1\}.*$//g'
}

