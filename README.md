# GitHub Action for NPM

This Action for hexo     enables arbitrary actions with the hexo command-line client

## Usage

An example workflow to clean, generate, and deploy an hexo to the default public registry follows:

```hcl
workflow "Clean, Generate, and Deploy" {
  on = "push"
  resolves = ["Deploy"]
}

action "Clean" {
  uses = "heowc/action-hexo@master"
  args = "clean"
}

action "Generate" {
  needs = "Build"
  uses = "heowc/action-hexo@master"
  args = "generate"
}

action "Deploy" {
  needs = "Tag"
  uses = "heowc/action-hexo@master"
  args = "deploy"
  env = {
    NAME = "input name ..."
    EMAIL = "input email ..."
  }
}
```

### Environment variables

* `NAME` - **Optional**. To specify a name when deploying. Defaults to ""

* `EMAIL` - **Optional**. To specify a name when deploying. Defaults to ""