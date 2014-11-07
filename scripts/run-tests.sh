#!/bin/bash
set -ev
if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
  export PULL_REQUEST_ID=${TRAVIS_PULL_REQUEST}
  bundle exec pronto run -f github_pr -c develop
fi
bundle exec rake
