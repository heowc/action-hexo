# GitHub Action for Hexo

This Action for hexo enables arbitrary actions with the hexo command-line client

## Usage

An example workflow to clean, generate, and deploy an hexo to the default public registry follows:

### 1. HCL syntax (not recommend, [it will be deprecated on September 30, 2019](https://help.github.com/en/articles/migrating-github-actions-from-hcl-syntax-to-yaml-syntax#about-the-new-yaml-syntax-for-github-actions))

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

### 2. YAML syntax (recommed, [how to migration](https://help.github.com/en/articles/migrating-github-actions-from-hcl-syntax-to-yaml-syntax#converting-workflow-files-in-your-repository-to-yaml-syntax))

```yaml
on: push
name: Deploy
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - name: Clean
      uses: heowc/action-hexo@master
      with:
        args: clean
    - name: Generate
      uses: heowc/action-hexo@master
      with:
        args: generate
    - name: Deploy
      uses: heowc/action-hexo@master
      env:
        EMAIL: input emial ...
        NAME: input name ...
      with:
        args: deploy

```
### Environment variables

If using `hexo-deployer-git` when `Deploy` action,

* `NAME` - **Optional**. To specify a name when deploying. Defaults to ""

* `EMAIL` - **Optional**. To specify a name when deploying. Defaults to ""