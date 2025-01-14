#!/bin/bash

me=$(whoami)

subject=$1
message=$2

if [ -z "$subject" ]; then
	echo "Subject is required."
	exit 1
fi

if [ -z "$message" ]; then
	message=$subject
fi

echo "$message" | mail -s "$subject" $me
