# GitHub Action to report to packtracker.io

This GitHub action will upload your webpack build stats to the packtracker.io service.

## Configuration

A sample workflow file might look something like this

```
workflow "packtracker.io" {
  on = "push"
  resolves = ["Report to packtracker.io"]
}

action "Report to packtracker.io" {
  uses = "packtracker/github-action@0.0.1"
  secrets = ["PT_PROJECT_TOKEN"]
  env = {
    "WEBPACK_CONFIG_PATH" = "./config/webpack/production.js"
  }
}
```

As you can see we're setting the path to the webpack config, and also adding a secret for the packtracker.io project token.
