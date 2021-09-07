#!/bin/sh

# This is an injector script. It will be run against all ext4 partitions on
# drive with serial number P02012407007, at the last stage of processing - after
# exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# The following example checks, if currently processed partition contains
# /home directory, and if so, creates a simple text file inside it.
#
#
# If you want to target all ext4 partitions, not only ones on particular drive,
# see "ext4" directory.

base=$1

if [ -d "$base/home" ] && [ ! -f "$base/home/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger injector for drive P02012407007 with ext4 filesystem." >"$base/home/drivebadger.txt"
fi
