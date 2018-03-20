#!/bin/sh

# Identify files that changed as part of pull request
export changed_files=`git --no-pager diff --name-only $CIRCLE_BRANCH $(git merge-base $CIRCLE_BRANCH master)`

# Extract directories that were changed
export folders=`echo $changed_files | cut -d '/' -f1 | uniq`

export whichgit=`which git`

echo "Which Git:"
echo $whichgit
echo "Files changed in this pull request: "
echo $changed_files
echo "Folders: "
echo $folders
echo "CIRCLE_BRANCH: "
echo $CIRCLE_BRANCH

for folder in $folders
do
    if [ $folder = "test" ];
    then
        echo "Changes detected in test folder ..."
        cd test && pwd
    elif [ $folder = "test2" ];
    then
        echo "Changes detected in test2 folder ..."
        cd test2 && pwd
    else
        echo "No changes detected that require test run!"
        exit 0;
    fi
done
