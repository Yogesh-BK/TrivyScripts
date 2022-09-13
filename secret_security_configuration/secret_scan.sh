#!/bin/bash
# declare -a dirs
# i=1
# for d in */
# do
#     dirs[i++]="${d%/}"
# done
# echo "There are ${#dirs[@]} directories that needs to be scanned"
# for((i=1;i<=${#dirs[@]};i++))
# do
#     echo "Started Scanning  $i.${dirs[i]}"
#     TARGET_PATH="./${dirs[i]}"
#     trivy fs --exit-code 1 "$TARGET_PATH"
#     echo "Completed Scanning $i.${dirs[i]}"
# done
TARGET_PATHS=("$@")
if [ -z "$TARGET_PATHS" ]; then
    TARGET_PATHS=(".")
fi
for TARGET_PATH in "${TARGET_PATHS[@]}";
do
echo "Started Scanning $TARGET_PATH"
trivy fs --exit-code 1 "$TARGET_PATH"
echo "Completed Scanning $TARGET_PATH"
done