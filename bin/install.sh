#!/bin/bash

FILES=`ls $ETC_DIR/*.json`

for FILE in $FILES
do
	FILENAME=$(basename -- "$FILE")
	KEY=`echo "$FILENAME" | cut -d'.' -f1`
	VALUE=`cat $FILE`

	echo "Adding settings of file $FILENAME..."
	
	etcdctl put /$KEY "$VALUE"
	
	echo "Settings of file $FILENAME added!"
done