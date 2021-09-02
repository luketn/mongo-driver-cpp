#/bin/sh

ORIG_FILES=$(echo $1/*)

$2

for FILE in $(echo $1/*) ; do
FOUND="no"
for OLD_FILE in $ORIG_FILES ; do
if [ "$OLD_FILE" == "$FILE" ] ; then
FOUND="yes"
fi
done

if [ "$FOUND" == "no" ] ; then
echo "$FILE"
fi
done
