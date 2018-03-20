#!/bin/sh

export org=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f4`
export repo=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f5`
export pr=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f7`

export GIT_API_URL="https://api.github.com/repos/$org/$repo/pulls/$pr"

export mergebase=`curl $GIT_API_URL | jq .base.sha | sed 's/\"//g'`

# Identify files that changed as part of pull request
export changed_files=`git --no-pager diff --name-only $CIRCLE_BRANCH $mergebase`

# Extract directories that were changed
export folders=`echo $changed_files | cut -d '/' -f1 | uniq`

echo "Files changed in this pull request: "
echo $changed_files
echo "Folders: "
echo $folders

for folder in $folders
do
    if [ $folder == "test" ];
    then
        echo "Changes detected in test folder ..."
        cd test && pwd
    elif [ $folder == "test2" ];
    then
        echo "Changes detected in test2 folder ..."
        cd test2 && pwd
    else
        continue
    fi
done
