#!/usr/bin/env bash

set -e

test -z "$Build_Debug" || set -x

test -z "$Build_Deps_Default_Paths" || {
  test -n "$SRC_PREFIX" || SRC_PREFIX=$HOME/build
  test -n "$PREFIX" || PREFIX=$HOME/.local
}

test -n "$sudo" || sudo=

req_src_pref()
{
  test -n "$SRC_PREFIX" || {
    echo "Not sure where checkout"
    exit 1
  }
  test -d $SRC_PREFIX || ${sudo} mkdir -vp $SRC_PREFIX
}

req_pref()
{
  test -n "$PREFIX" || {
    echo "Not sure where to install"
    exit 1
  }

  test -d $PREFIX || ${sudo} mkdir -vp $PREFIX
}

install_bats()
{
  req_src_pref
  req_pref
  echo "Installing bats"
  local pwd=$(pwd)
  mkdir -vp $SRC_PREFIX
  cd $SRC_PREFIX
  git clone https://github.com/dotmpe/bats.git
  cd bats
  ${sudo} ./install.sh $PREFIX
  cd $pwd
}

install_git_versioning()
{
  req_src_pref
  req_pref
  test -e $SRC_PREFIX/git-versioning && {
    ( cd $SRC_PREFIX/git-versioning && git checkout master && git pull origin master )
  } || {
    git clone https://github.com/dotmpe/git-versioning.git $SRC_PREFIX/git-versioning
  }
  ( cd $SRC_PREFIX/git-versioning && ./configure.sh $PREFIX && ENV=production ./install.sh )
}


main_entry()
{
  test -n "$1" || set -- '-'

  case "$1" in '-'|build|test|sh-test|bats )
      test -x "$(which bats)" || { install_bats || return $?; }
    ;; esac

  case "$1" in '-'|dev|build|check|test|git-versioning )
      test -x "$(which git-versioning)" || {
        install_git_versioning || return $?; }
    ;; esac

  case "$1" in '-'|npm)
      npm install -g grunt-cli
      npm install -g grunt@0.4.1
      npm install -g bower
      npm install -g recess
      npm install -g stylus
    ;; esac

  echo "OK. All pre-requisites for '$1' checked"
}

test "$(basename $0)" = "install-dependencies.sh" && {
  while test -n "$1"
  do
    main_entry "$1" || exit $?
    shift
  done
} || printf ""

# Id: jenkins-userContent/0.0.3-dev install-dependencies.sh
