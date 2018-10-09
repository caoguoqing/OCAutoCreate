#/bin/sh

pwds=$(PWD)
file_name=$1
parent_class=$2



fileh="${pwds}/CocoaTouchClass.xctemplate/GCBaseVCObjective-C/___FILEBASENAME___.h"
filehcontent=$(cat $fileh)
echo -e $filehcontent > "${file_name}.h"