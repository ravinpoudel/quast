#!/bin/bash

# installs general QUAST pipeline and general MetaQUAST pipeline. 
# MetaQUAST for de novo datasets (without references) will NOT be installed.

quast_home=$(dirname "$0")

stdout_log_fname=$quast_home/install_log.stdout
echo "Starting QUAST test... (stdout redirected to $stdout_log_fname)"
echo "" > $stdout_log_fname
echo "Starting QUAST test" >> $stdout_log_fname
$quast_home/quast.py --test >> $stdout_log_fname
return_code=$?
if [ $return_code -ne 0 ]; then
   echo 'ERROR! QUAST TEST FAILED!'
   exit 1
fi
echo "Starting MetaQUAST test... (stdout redirected to $stdout_log_fname)"
echo "" >> $stdout_log_fname
echo "Starting MetaQUAST test" >> $stdout_log_fname
$quast_home/metaquast.py --test >> $stdout_log_fname
return_code=$?
if [ $return_code -ne 0 ]; then
   echo 'ERROR! METAQUAST TEST FAILED!'
   exit 1
fi
echo 'QUAST INSTALLED SUCCESSFULLY!'
exit 0
