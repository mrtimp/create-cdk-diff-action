#!/bin/sh -e

GITHUB_REPOSITORY=$(echo "$GITHUB_REPOSITORY" | cut -d"/" -f2)
PULL_REQUEST_ID=$(echo "$GITHUB_REF_NAME" | cut -d"/" -f1)

/usr/local/bin/cdk-notifier \
  --delete "$1" \
  --log-file "$2" \
  --owner "$GITHUB_REPOSITORY_OWNER" \
  --pull-request-id "$PULL_REQUEST_ID" \
  --repo "$GITHUB_REPOSITORY" \
  --tag-id "$3" \
  --template "$4" \
  --token "$GITHUB_TOKEN" \
  --vcs github \
  --verbosity "$5"