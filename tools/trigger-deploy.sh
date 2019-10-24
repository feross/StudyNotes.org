#!/bin/sh
# Trigger a deploy on server
set -e

git push
ssh future -t zsh -ci "/home/feross/www/studynotes.org/tools/deploy.sh"
echo curl https://api.rollbar.com/api/1/deploy/ -F access_token=$(node -p 'require("./secret").rollbar.accessToken') -F environment=production -F revision=$(git log -n 1 --pretty=format:"%H") -F local_username=$(whoami)
