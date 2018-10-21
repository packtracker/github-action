#!/bin/sh

set -eu
: "${WEBPACK_CONFIG_PATH:?'You must provide the path to your webpack configuration with the WEBPACK_CONFIG environment variable'}"
: "${PT_PROJECT_TOKEN:?'You must set the PT_PROJECT_TOKEN secret'}"

if [ -e yarn.lock ]; then
  if ! yarn install; then
    echo "yarn install failed" 1>&2
    exit 1
  fi

  yarn add @packtracker/webpack-plugin@1.0.1
else
  if ! npm install; then
    echo "npm install failed" 1>&2
    exit 1
  fi

  npm install @packtracker/webpack-plugin@1.0.1
fi

node ./report.js
