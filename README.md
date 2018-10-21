# GitHub Action to report to packtracker.io

This GitHub action will upload your webpack build stats to the packtracker.io service.

## Configuration

### Secrets

  - `PT_PROJECT_TOKEN` - your [packtracker.io](https://packtracker.io) project token.

### Environment variables

  - `WEBPACK_CONFIG_PATH` - the relative path to your webpack configuration

### Workflow

A sample workflow file might look something like this

```
workflow "packtracker.io" {
  on = "push"
  resolves = ["Report to packtracker.io"]
}

action "Report to packtracker.io" {
  uses = "packtracker/github-action@1.0.1"
  secrets = ["PT_PROJECT_TOKEN"]
  env = {
    "WEBPACK_CONFIG_PATH" = "./config/webpack/production.js"
  }
}
```
