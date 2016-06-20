#!/usr/bin/env bash

set -e

# if [ ! -f CNAME ]; then
#   touch CNAME
# fi

echo $URL >> CNAME
git config user.name $GIT_USER
git config user.email $GIT_EMAIL
git add --all
git commit -m "Deploy from Travis CI"
git push -f -q "https://${GITHUB_TOKEN}@github.com/${GITHUB_RELEASE_REPO}.git" ${RELEASE_BRANCH}:gh-pages > /dev/null 2>&1
