#!/bin/bash

# current name
[[ "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" =~  .*/(.*)$ ]]
export CURRENT_OTP="${BASH_REMATCH[1]}"
export CURRENT_NAME=$(echo "$CURRENT_OTP" | sed -r 's/(^|_)([a-z])/\U\2/g')

# new name
export NEW_OTP=$1
export NEW_NAME=$(echo "$NEW_OTP" | sed -r 's/(^|_)([a-z])/\U\2/g')

echo "CURRENT_OTP=$CURRENT_OTP"
echo "CURRENT_NAME=$CURRENT_NAME"
echo "NEW_OTP=$NEW_OTP"
echo "NEW_NAME=$NEW_NAME"

if [[ -z "$NEW_NAME" ]]; then
    echo 'Missing new OTP name. e.g. hello_world'
    exit 1
fi

git grep -l $CURRENT_OTP | xargs --no-run-if-empty sed -i '' -e "s/$CURRENT_OTP/$NEW_OTP/g"
git grep -l $CURRENT_NAME | xargs --no-run-if-empty sed -i '' -e "s/$CURRENT_NAME/$NEW_NAME/g"

mv lib/$CURRENT_OTP lib/$NEW_OTP
mv lib/$CURRENT_OTP.ex lib/$NEW_OTP.ex

mv "../${BASH_REMATCH[1]}" "../$NEW_OTP"