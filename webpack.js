const webpack = require('webpack')
const PacktrackerPlugin = require('@packtracker/webpack-plugin')
const config = require(process.env.WEBPACK_CONFIG_PATH)

config.plugins.push(new PacktrackerPlugin())

webpack(config, (err) => {
  if (err) {
    process.exit(1)
  } else {
    process.exit(0)
  }
})
