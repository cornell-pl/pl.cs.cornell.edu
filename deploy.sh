#!/bin/zsh

set -e
set -x

current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
deploy_branch="master"
website=""

if [[ "$current_branch" != "$deploy_branch" ]]; then
  echo "Error: Must deploy from branch \"$deploy_branch\"."
  exit 1
fi

## Start hugo server to checklinks.
#if hash linkchecker; then
  #echo "linkchecker found, checking links."

  ## If a hugo server is already running, don't run another one.
  #if [ "$(pgrep hugo)" -eq "" ]; then
    #hugo server &
    #SERVER_PID="$!"
    #linkchecker http://localhost:1313 --check-extern
    #kill "${SERVER_PID}"
  #else
    #linkchecker http://localhost:1313 --check-extern
  #fi
#else
  #echo "linkchecker not found, skipping link checks"
#fi

# Remove existing public folder.
rm -rf public/

# Build the website.
hugo

# If purify-css is installed as an exec, purify bootstrap.min.css
if hash purifycss; then
    echo -n "purifycss was found! Running ..."

    CSS_FILE="./public/styles.css"
    find public/ -name "*html" -type f | \
      xargs purifycss "$CSS_FILE" --info --min --out "$CSS_FILE"

    BOOTSTRAP_CSS="./public/css/bootstrap.min.css"
    find public/ -name "*html" -type f | \
      xargs purifycss "$BOOTSTRAP_CSS" --info --min --out "$BOOTSTRAP_CSS"

  else
    echo "purifycss was not found!"
fi

# Move public/ to docs/ for github pages deployment.
rm -rf docs/
mv public/ docs/
git checkout docs/CNAME

if [[ "$website" != "" ]]; then
  # Push the changes to the remote server
  rsync -a --delete-excluded docs/ "$website"

  if [ "$?" -ne 0 ]; then
      echo "Failed to update the remote website server!"
  fi
else
  echo "No website configured."
fi

echo "Commit the docs/ folder to deploy to github pages."
