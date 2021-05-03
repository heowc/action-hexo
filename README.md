# GitHub Action for Hexo

This Action for hexo enables arbitrary actions with the hexo command-line client

## Usage

An example workflow to clean, generate, and deploy an hexo to the default public registry follows:

### YAML syntax
```yaml
on: push
name: Deploy
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
    - name: Clean
      uses: heowc/action-hexo@main
      with:
        args: clean
    - name: Generate
      uses: heowc/action-hexo@main
      with:
        args: generate
    - name: Deploy
      uses: heowc/action-hexo@main
      env:
        EMAIL: <your-input-email>
        NAME: <your-input-name>
      with:
        args: deploy

```
### Environment variables

If using `hexo-deployer-git` when `Deploy` action,

* `NAME` - **Optional**. To specify a name when deploying. Defaults to ""

* `EMAIL` - **Optional**. To specify a name when deploying. Defaults to ""
