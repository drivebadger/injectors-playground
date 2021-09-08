## This repository is not meant for direct usage.

This is a playground repository, containing several examples of injectors,
for most filesystem types and network shares. Injectors are scripts, that,
if present, are run against partitions or network shares, after finishing
exfiltrating data and remounting them to read/write mode.

Basically the role of injector scripts is to make changes to partition
contents: create files or directories, write data to them, delete etc.

**Injectors should be used very carefully**, especially regarding checking
various conditions and making sure, that proper filesystem is modified:

- injectors have full access to modified filesystem, all ACLs are disabled
- there is no "undo" operation


### Matching proper filesystem

There are 3 types of injectors:

1. Attached to specific partition UUID, eg. [`070c6f50-c111-4d49-9867-1489418f3b2e`](uuid-070c6f50-c111-4d49-9867-1489418f3b2e/injector.sh). Such injectors are executed only against this particular partition.

2. Attached to filesystem/encryption type and drive serial number, eg. [`ext4-P02012407007`](ext4-P02012407007/injector.sh). Such injectors are executed against all ext4 partitions on drive `P02012407007`.
You are responsible to implement additional conditions checking, which exact filesystem is modified.

3. Specific only to:

- filesystem type (eg. [`ntfs`](ntfs/injector.sh), [`ext4`](ext4/injector.sh))
- encryption type (eg. `luks`, [`bitlocker`](bitlocker/injector.sh), [`veracrypt`](veracrypt/injector.sh))
- network share type ([`nfs`](nfs/injector.sh), [`cifs`](cifs/injector.sh))

these injectors will be executed against **all** partitions and shares of given type.


### Installing

1. Create your own injectors. Each injector script should have name `injector.sh`. There are no other requirements. Inside you are free to execute whatever you want.

2. Put each injector into subdirectory of `/opt/drivebadger/injectors`. Check twice, if the subdirectory name is complete and correct.

3. If you have doubts regarding order of execution etc., please see [this file](https://github.com/drivebadger/drivebadger/blob/master/internal/generic/get-injector-script.sh).


### More information

- [Drive Badger main repository](https://github.com/drivebadger/drivebadger)
- [Drive Badger wiki](https://github.com/drivebadger/drivebadger/wiki)
