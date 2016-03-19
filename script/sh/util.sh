#/bin/sh

set -e

# Id: jenkins-userContent/0.0.2-master script/sh/util.sh


get_properties()
{
  grep -v '^\ *#' | \
    grep -i '[:=]\ *\(true\|1\|yes\|on\|ok\)\ *$' | \
    sed 's/\ *[:=]\{1\}.*$//g'
}

