#!/bin/sh

grep '^nok' build.tap && {
  echo "Errors in build"
  exit 1
} || {
  echo "No errors in build"
}

