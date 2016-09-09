#!/usr/bin/env bats

base=$(basename $0 .bats)

. ./script/sh/util.sh

@test "Features are correctly parsed to a string - I" {

  TMP=/tmp/$(./script/sh/uuidgen.sh)
  diag "TMP=$TMP"

#  {
#    cat <<EOF
#      foo: true
#      #bar: true
#      foo-1: true
#      foo-2=true
#      foo-3= true
#      foo-4 = true
#      foo-5 : true
#      foo-6 =true
#      foo-7 :true
#      foo-10: 1
#      foo-11: yes
#      foo-12: ok
#      foo-20=xyz
#      foo-21 = xyz
#      foo-25 : xyz
#      foo-26: bar-value.ext
#      foo-27:bar-value.ext
#      foo.bar.baz = true
#EOF
#  } > $TMP-features.properties
#  build_features="$(echo $(get_properties < $TMP-features.properties))"
#  #echo $build_features > build_features.str
#  test "$build_features" = "foo foo-1 foo-2 foo-3 foo-4 foo-5 foo-6 foo-7 foo-10 foo-11 foo-12 foo.bar.baz"
}

@test "Features are correctly parsed to a string - defaults" {
  echo
#  build_features="$(echo $(get_properties < default-features.properties))"
#  #echo $build_features > build_features.str
#  test "$build_features" = "bootstrap-css doony-css extra-css jsonview-css extra-js"
}

#@test "Features are correctly parsed to a string - generated" {
#  echo grunt shell:generateFeatures -env=$base-3 
#}


