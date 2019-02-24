const fs = require('fs')
const webpack = require('webpack')
const PacktrackerPlugin = require('@packtracker/webpack-plugin')
const event = require(process.env.GITHUB_EVENT_PATH)


let config = {}
if (fs.lstatSync(process.env.WEBPACK_CONFIG_PATH).isFile()) {
  config = require(process.env.WEBPACK_CONFIG_PATH)
}

const pt_config = {
  upload: true,
  fail_build: true,
  branch: event.ref.replace('refs/heads/', ''),
  author: event.head_commit.author.email,
  message: event.head_commit.message,
  commit: process.env.GITHUB_SHA,
  committed_at: parseInt(+new Date(event.head_commit.timestamp) / 1000),
  prior_commit: event.before,
}

config.plugins = config.plugins || []
config.plugins.push(new PacktrackerPlugin(pt_config))

webpack(config, (err) => {
  if (err) {
    process.exit(1)
  } else {
    console.log(fs.readFileSync('/github/workspace/public/packs/manifest-caddb7b89874c545619b.js', 'utf8'))
    process.exit(0)
  }
})
