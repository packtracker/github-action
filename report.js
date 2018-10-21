const webpack = require('webpack')
const PacktrackerPlugin = require('@packtracker/webpack-plugin')
const config = require(process.env.WEBPACK_CONFIG_PATH)
const event = require(process.env.GITHUB_EVENT_PATH)

const pt_config = {
  upload: true,
  branch: event.ref.replace('refs/heads/', ''),
  author: event.head_commit.author.email,
  message: event.head_commit.message,
  commit: process.env.GITHUB_SHA,
  committed_at: +new Date(event.head_commit.timestamp),
  prior_commit: event.before
}

console.log(pt_config)
console.log('event')
console.log(event)

config.plugins.push(new PacktrackerPlugin(pt_config))


//webpack(config, (err) => {
//  if (err) {
//    process.exit(1)
//  } else {
//    process.exit(0)
//  }
//})
