#!/bin/sh

# This is an injector script. It will be run against all Bitlocker-encrypted
# partition at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# The following example checks, if currently processed partition contains
# Users directory (often C:\Users), and if so, creates a simple text file.
#
#
# If you want to match a specific Bitlocker partition, instead of executing
# such code on all partitions, you have 2 options:
#
# 1. Rename directory with this script from "bitlocker" to "bitlocker-P02012407007",
#    where "P02012407007" part is the serial number of the physical drive.
#
# 2. Check for more specific conditions below - eg. for existence of some
#    specific directory, like C:\Users\your.chosen.user
#
# You can also match specific unencrypted partition by UUID - however this
# is not possible for Bitlocker.

base=$1

if [ -d "$base/Users" ] && [ ! -f "$base/Users/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger Bitlocker generic injector." >"$base/Users/drivebadger.txt"
fi
