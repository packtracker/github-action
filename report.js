const path = require('path')
const webpack = require('webpack')
const PacktrackerPlugin = require('@packtracker/webpack-plugin')
const config = require(process.env.WEBPACK_CONFIG_PATH)
const event = require(path.join(process.env.GITHUB_WORKFLOW, 'event.json'))

const pt_config = {
  upload: true,
  branch: event.ref.replace('/refs/heads/', ''),
  author: event.head_commnit.author.email,
  message: event.head_commit.message,
  commit: event.head_commit.sha,
  committed_at: +new Date(event.head_commit.timestamp),
  prior_commit: event.before
}

console.log(pt_config)

config.plugins.push(new PacktrackerPlugin(pt_config))

console.log('event')
console.log(event)

//webpack(config, (err) => {
//  if (err) {
//    process.exit(1)
//  } else {
//    process.exit(0)
//  }
//})
