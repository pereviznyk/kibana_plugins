#!/bin/bash
set -e

rm -Rf releases
mkdir -p releases

function build {
    npm run build -- -k $1
    for old in build/datasweet_formula-*; do
      new=$(echo $old | sed -E "s/(^build)(\/datasweet_formula-.+)\.zip$/releases\2_kibana-$1.zip/")
      mv -v "$old" "$new"
    done
}

if [ -n "$1" ]; then
  build $1
  exit
fi

build 6.4.2
build 6.4.1
build 6.4.0

build 6.3.2
build 6.3.1
build 6.3.0
build 6.2.4
build 6.2.3
build 6.2.2
build 6.2.1
build 6.2.0

build 6.1.3
build 6.1.2
build 6.1.1
build 6.1.0

build 6.0.1
build 6.0.0

build 5.6.7
build 5.6.6
build 5.6.5
build 5.6.4
build 5.6.3
build 5.6.2
build 5.6.1
build 5.6.0