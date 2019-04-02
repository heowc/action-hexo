# GitHub Action for Hexo

This Action for hexo enables arbitrary actions with the hexo command-line client

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
  needs = "Clean"
  uses = "heowc/action-hexo@master"
  args = "generate"
}

action "Deploy" {
  needs = "Generate"
  uses = "heowc/action-hexo@master"
  args = "deploy"
  env = {
    NAME = "input name ..."
    EMAIL = "input email ..."
  }
}
```

### Environment variables

If using `hexo-deployer-git` when `Deploy` action,

* `NAME` - **Optional**. To specify a name when deploying. Defaults to ""

* `EMAIL` - **Optional**. To specify a name when deploying. Defaults to ""