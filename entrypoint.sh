#!/bin/sh

set -eu
: "${WEBPACK_CONFIG_PATH:?'You must provide the path to your webpack configuration with the WEBPACK_CONFIG environment variable'}"
: "${PT_PROJECT_TOKEN:?'You must set the PT_PROJECT_TOKEN secret'}"

event_file='/github/workflow/event.json'
export PT_BRANCH=$(echo $GITHUB_REF | sed "s/refs\/heads\///g")
export PT_AUTHOR=$(cat $event_file | jq -r '.head_commit.author.email')
export PT_MESSAGE=$(cat $event_file | jq -r '.head_commit.message')
export PT_COMMIT=$GITHUB_SHA
export PT_COMMITTED_AT=$(date -d $(cat $event_file | jq -r '.head_commit.timestamp') +'%s')
export PT_PRIOR_COMMIT=$(cat $event_file | jq -r '.before')

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

PT_UPLOAD=true node ./webpack.js
