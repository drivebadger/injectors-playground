#!/bin/sh

# This is an injector script. It will be run against all NTFS partitions,
# at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# The following example checks, if currently processed partition contains
# Users directory (often C:\Users), and if so, creates a simple text file.
#
#
# If you want to match a specific NTFS partition, instead of executing
# such code on all partitions, you have 3 options:
#
# 1. Rename directory with this script from "ntfs" to "ntfs-P02012407007",
#    where "P02012407007" part is the serial number of the physical drive.
#
# 2. Rename it to "uuid-070c6f50-c111-4d49-9867-1489418f3b2e", where
#    "070c6f50-c111-4d49-9867-1489418f3b2e" part is the UUID of the specific
#    partition.
#
# 3. Check for more specific conditions below - eg. for existence of some
#    specific directory, like C:\Users\your.chosen.user

base=$1

if [ -d "$base/Users" ] && [ ! -f "$base/Users/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger NTFS generic injector." >"$base/Users/drivebadger.txt"
fi
