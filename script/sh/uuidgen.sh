#!/bin/sh

set -e


case "$(uname)" in Darwin )
    LANG=C LC_CTYPE=C
  ;;
esac

cat /dev/urandom \
  | tr -dc 'a-zA-Z0-9' \
  | fold -w 32 \
  | head -n 1

