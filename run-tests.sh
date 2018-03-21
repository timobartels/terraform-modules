#!/bin/sh

export TEST_ENV=$1

echo "TEST_ENV value is: $TEST_ENV"

if [ -z $CIRCLE_PULL_REQUEST ]
then
    echo "No pull request, skipping this test"
    exit 0
fi

export org=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f4`
export repo=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f5`
export pr=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f7`

export GIT_API_URL="https://api.github.com/repos/$org/$repo/pulls/$pr"

export mergebase=`curl $GIT_API_URL | jq .base.sha | sed 's/\"//g'`

# Extract directories that were changed
export folders=`git --no-pager diff --name-only $CIRCLE_BRANCH $mergebase | cut -d '/' -f1 | uniq`

echo "Folders that were affected by this PR: "
echo $folders

for folder in $folders
do
    if [ $folder = "test" ] && [ $folder = $TEST_ENV ]
    then
        echo "Changes detected in test folder ..."
        cd test && pwd
    elif [ $folder = "test2" ] && [$folder = $TEST_ENV ]
    then
        echo "Changes detected in test2 folder ..."
        cd test2 && pwd
    else
        continue
    fi
done
