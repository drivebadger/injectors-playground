#!/bin/sh

# This is an injector script. It will be run against all ext4 partitions,
# except partitions on drive with serial number P02012407007 - these will
# be handled by separate, more specific injector script (look at the
# directory layout).
#
# It will be run at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# The following example checks, if currently processed partition contains
# /home directory, and if so, creates a simple text file inside it.
#
#
# If you want to match a specific ext4 partition, instead of executing
# such code on all partitions, you have 3 options:
#
# 1. Rename directory with this script from "ext4" to "ext4-P02012407007",
#    where "P02012407007" part is the serial number of the physical drive
#    (as mentioned above, such example is already present).
#
# 2. Rename it to "uuid-070c6f50-c111-4d49-9867-1489418f3b2e", where
#    "070c6f50-c111-4d49-9867-1489418f3b2e" part is the UUID of the specific
#    partition.
#
# 3. Check for more specific conditions below - eg. for existence of some
#    specific directory, like /home/your.chosen.user

base=$1

if [ -d "$base/home" ] && [ ! -f "$base/home/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger Linux/ext4 generic injector." >"$base/home/drivebadger.txt"
fi
