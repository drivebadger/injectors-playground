#!/bin/sh

# This is an injector script. It will be run against all CIFS (SMB) network
# shares, at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the share is mounted.
#
# The following example checks, if currently processed share contains
# "klienci" directory, and if so, creates a simple text file inside it.
#
#
# Exact matching CIFS shares by UUID or serial number is not supported,
# the only way is to match the directory layout directly from the code.

base=$1

if [ -d "$base/klienci" ] && [ ! -f "$base/klienci/drivebadger.txt" ]; then
	echo "This is a test message from Drive Badger CIFS generic injector." >"$base/klienci/drivebadger.txt"
fi
