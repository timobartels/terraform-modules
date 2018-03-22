#!/bin/sh

export TEST_ENV=$1

if [ -z $CIRCLE_PULL_REQUEST ]
then
    echo "No pull request, skipping this test"
    exit 0
fi

export pr=`echo $CIRCLE_PULL_REQUEST | cut -d '/' -f7`

git fetch origin "pull/$pr/head:pr_$pr"
git checkout "pr_$pr"
export folders=`git --no-pager diff --name-only $CIRCLE_BRANCH $(git merge-base $CIRCLE_BRANCH master) | cut -d '/' -f1 | uniq`


# Extract directories that were changed
#export folders=`git --no-pager diff --name-only $CIRCLE_BRANCH $mergebase | cut -d '/' -f1 | uniq`

echo "Folders that were affected by this PR: "
echo $folders

for folder in $folders
do
    if [ $folder = $TEST_ENV ];
    then
        echo "Changes detected in $TEST_ENV folder ..."
        cd $TEST_ENV && pwd
    fi
done

