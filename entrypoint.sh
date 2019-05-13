#!/bin/sh

set -eu

: "${PT_PROJECT_TOKEN:?'You must set the PT_PROJECT_TOKEN secret'}"

if [ -n "${PT_PROJECT_ROOT+1}" ]; then
  echo "Custom root directory detected, navigating to: $PT_PROJECT_ROOT"
  cd $PT_PROJECT_ROOT
fi

if [ -e yarn.lock ]; then
  if ! yarn install; then
    echo "yarn install failed" 1>&2
    exit 1
  fi

  yarn add @packtracker/webpack-plugin@2.0.1
elif [ -e package.json ]; then
  if ! npm install; then
    echo "npm install failed" 1>&2
    exit 1
  fi

  npm install @packtracker/webpack-plugin@2.0.1
else
  echo "Could not find package.json within $(pwd)" 1>&2
  echo 'Try setting a custom root directory with the $PT_PROJECT_ROOT environment variable to set a custom root path.' 1>&2
  exit 2
fi

cp /report.js ./report.js
node ./report.js
rm ./report.js

if [ -e yarn.lock ]; then
  yarn remove @packtracker/webpack-plugin
else
  npm uninstall @packtracker/webpack-plugin
fi
