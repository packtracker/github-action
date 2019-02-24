#!/bin/sh

set -eu

: "${PT_PROJECT_TOKEN:?'You must set the PT_PROJECT_TOKEN secret'}"

if [ -e yarn.lock ]; then
  if ! yarn install; then
    echo "yarn install failed" 1>&2
    exit 1
  fi

  yarn add git+https://jondavidjohn@github.com/packtracker/webpack-plugin.git#feature/use-webpack-bundle-analyzer-directly
else
  if ! npm install; then
    echo "npm install failed" 1>&2
    exit 1
  fi

  npm install git+https://jondavidjohn@github.com/packtracker/webpack-plugin.git#feature/use-webpack-bundle-analyzer-directly
fi

cp /report.js ./report.js
node ./report.js
