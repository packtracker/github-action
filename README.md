# THIS ACTION IS DEPRECATED

This action has been deprecated as of version 2.1.2.

Please use https://github.com/packtracker/report instead.

## GitHub Action to report webpack stats to [packtracker.io](https://packtracker.io/?utm_source=github&utm_medium=action&utm_campaign=links)

This GitHub action will upload your webpack build stats to the packtracker.io service.

### Configuration

#### Secrets (Required)

  - `PT_PROJECT_TOKEN` - your [packtracker.io](https://packtracker.io/?utm_source=github&utm_medium=action&utm_campaign=links) project token.

#### Environment variables (Optional)

  - `WEBPACK_CONFIG_PATH` - the relative path to your webpack configuration (if you have one)
  - `PT_PROJECT_ROOT` - the relative path to the directory of your project (containing your package.json file)

#### Workflow

A sample workflow file might look something like this

```
workflow "packtracker.io" {
  on = "push"
  resolves = ["Report to packtracker.io"]
}

action "Report to packtracker.io" {
  uses = "packtracker/github-action@2.1.2"
  secrets = ["PT_PROJECT_TOKEN"]
  env = {
    "WEBPACK_CONFIG_PATH" = "./config/webpack/production.js"
    "PT_PROJECT_ROOT" = "./path/to/subdirectory"
  }
}
```
