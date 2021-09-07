#!/bin/sh

# This is an injector script. It will be run only against partition matched
# by UUID, at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# The following example checks, if currently processed partition contains
# /home directory, and if so, creates a simple text file inside it.

base=$1

if [ -d "$base/home" ] && [ ! -f "$base/home/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger injector for UUID=070c6f50-c111-4d49-9867-1489418f3b2e." >"$base/home/drivebadger.txt"
fi
