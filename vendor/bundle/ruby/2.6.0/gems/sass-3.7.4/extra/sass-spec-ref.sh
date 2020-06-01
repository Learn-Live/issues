#!/bin/bash -e
# Copyright 2016 Google Inc. Use of this source code is governed by an MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT.

# Echoes the sass-spec Git ref that should be checked out for the current Travis
# run. If we're running specs for a pull request which refers to a sass-spec
# pull request, we'll run against the latter rather than sass-spec master.

default=master

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo >&2 "TRAVIS_PULL_REQUEST: $TRAVIS_PULL_REQUEST."
  echo >&2 "Ref: $default."
  echo "$default"
  exit 0
fi

echo >&2 "Fetching pull request $TRAVIS_PULL_REQUEST..."

url=https://api.github.com/repos/sass/ruby-sass/pulls/$TRAVIS_PULL_REQUEST
if [ -z "$GITHUB_AUTH" ]; then
  echo >&2 "Fetching pull request info without authentication"
  JSON=$(curl -L -sS $url)
else
  echo >&2 "Fetching pull request info as sassbot"
  JSON=$(curl -u "sassbot:$GITHUB_AUTH" -L -sS $url)
fi
echo >&2 "$JSON"

RE_SPEC_PR="sass\/sass-spec(#|\/pull\/)([0-9]+)"

if [[ $JSON =~ $RE_SPEC_PR ]]; then
  ref="pull/${BASH_REMATCH[2]}/head"
  echo >&2 "Ref: $ref."
  echo "$ref"
else
  echo >&2 "Ref: $default."
  echo "$default"
fi
