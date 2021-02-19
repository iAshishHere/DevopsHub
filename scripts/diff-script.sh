#!/bin/bash
FOLDER1_PATH="folder1/"
FOLDER2_PATH="folder2/"            
CHANGED_FILES=$(git diff HEAD HEAD~ --name-only)
FOLDER1_MATCH_COUNT=0
FOLDER2_MATCH_COUNT=0

echo "Checking for file changes..."
for FILE in $CHANGED_FILES
do
if [[ $FILE == *$FOLDER1_PATH* ]]; then
  echo "MATCH:  ${FILE} changed"
  MATCH_FOUND=true
  FOLDER1_MATCH_COUNT=$(($FOLDER1_MATCH_COUNT+1))
elif [[ $FILE == *$FOLDER2_PATH* ]]; then
  echo "MATCH:  ${FILE} changed"
  MATCH_FOUND=true
  FOLDER2_MATCH_COUNT=$(($FOLDER2_MATCH_COUNT+1))
else
  echo "IGNORE: ${FILE} changed"
fi
done
echo "$FOLDER1_MATCH_COUNT match(es) for filter '$FOLDER1_PATH' found."
echo "$FOLDER2_MATCH_COUNT match(es) for filter '$FOLDER2_PATH' found."
if [[ $FOLDER1_MATCH_COUNT -gt 0 ]]; then
echo "##vso[task.setvariable variable=SOURCE_CODE_CHANGED;isOutput=true]true"
echo "##vso[task.setvariable variable=isFolder1ChangeFound;]true"
else
echo "##vso[task.setvariable variable=SOURCE_CODE_CHANGED;isOutput=true]false"
echo "##vso[task.setvariable variable=isFolder2ChangeFound;]false"
fi
echo $SOURCE_CODE_CHANGED
echo $isFolder1ChangeFound

if [[ $FOLDER2_MATCH_COUNT -gt 0 ]]; then
echo "##vso[task.setvariable variable=SOURCE_CODE_CHANGED;isOutput=true]true"
echo "##vso[task.setvariable variable=isFolder2ChangeFound;]true"
else
echo "##vso[task.setvariable variable=SOURCE_CODE_CHANGED;isOutput=true]false"
echo "##vso[task.setvariable variable=isFolder2ChangeFound;]false"
fi
echo $SOURCE_CODE_CHANGED
echo $isFolder2ChangeFound
