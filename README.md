# Create CDK Diff GitHub Action

GitHub Action to parse a CDK log file and post changes to pull request requests. Can be used to get more confidence on 
approving pull requests because reviewer will be aware of changes done to your environments.

Read more about the [cdk-notifier](https://github.com/karlderkaefer/cdk-notifier).

## Example usage

```yaml
name: Pull Requests

on:
  pull_request:

jobs:
  ci:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      issues: write
      pull-requests: write
    steps:
      - name: Checkout source code
        uses: actions/checkout@v3
        
      - name: CDK diff
        run: |
          cdk diff --progress=events &> >(tee cdk.log)

      - name: CDK Notifier
        uses: te-whatunga-kapua/create-cdk-diff-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Optional inputs

- `delete` Delete comments when no changes are detected for a specific tag id (default `true`)
- `log-file` Path to cdk log file (default `./cdk.log`)
- `tag-id` Unique identifier for stack within pipeline (default `stack`)
- `template` Template to use for comment [default|extended|extendedWithResources] (default `default`)
- `verbosity` Log level (debug, info, warn, error, fatal, panic) (default `info`)

## ENV

- `GITHUB_REF_NAME` **Required** Used to obtain the pull request ID
- `GITHUB_REPOSITORY` **Required**
- `GITHUB_REPOSITORY_OWNER` **Required**
- `GITHUB_TOKEN` Required for `actions_comment=true`
