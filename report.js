const webpack = require('webpack')
const PacktrackerPlugin = require('@packtracker/webpack-plugin')
const config = require(process.env.WEBPACK_CONFIG_PATH)

config.plugins.push(new PacktrackerPlugin())

console.log('Hello Packtracker')
