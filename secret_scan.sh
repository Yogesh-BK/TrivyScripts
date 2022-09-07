#!/bin/bash
echo "Welcome Yogesh"
declare -a dirs
i=1
for d in */
do
    dirs[i++]="${d%/}"
done
echo "There are ${#dirs[@]} dirs in the current path"
for((i=1;i<=${#dirs[@]};i++))
do
    echo "Inside $i.${dirs[i]}"
    echo "Started Scanning  $i.${dirs[i]}"
    TARGET_PATH="./${dirs[i]}"
    echo $TARGET_PATH
    # trivy fs --exit-code 1 $TARGET_PATH
    echo "Completed Scanning $i.${dirs[i]}"
done
# TARGET_PATHS=("$@")
# if [ -z "$TARGET_PATHS" ]; then
#     TARGET_PATHS=(".")
# fi
# for TARGET_PATH in "${TARGET_PATHS[@]}";
# do
# echo "Started Scanning $TARGET_PATH"
# trivy fs --exit-code 1 $TARGET_PATH
# echo "Completed Scanning $TARGET_PATH"
# done