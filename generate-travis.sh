#!/usr/bin/env bash

source ./versions.sh

readarray -t _sorted < <(printf '%s\n' "${!VERSIONS[@]}" | sort)

to_build=""

for version in "${_sorted[@]}"; do
  to_build="${to_build}\\n    - OS=centos DIST=7 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=ubuntu DIST=14.04 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=ubuntu DIST=16.04 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=ubuntu DIST=17.10 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=debian DIST=8 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=debian DIST=9 PHPV=\"${version}\""
  to_build="${to_build}\\n    - OS=\"rockyluke/devuan\" DIST=1 PHPV=\"${version}\""
done

sed -e "s:&&OS_TO_TEST&&:${to_build}:g" .travis.yml.sample | tee .travis.yml
