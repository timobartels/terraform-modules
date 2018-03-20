#!/bin/sh

# Identify files that changed as part of pull request
export changed_files=`git --no-pager diff --name-only $CIRCLE_BRANCH $(git merge-base $CIRCLE_BRANCH master)`

#export test=`git merge-base test-again master`
export test=155a93dac900bbceb761b1a22bff35a47479b092

export changed_files=`git --no-pager diff --name-only test-again $test`

echo $out

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
