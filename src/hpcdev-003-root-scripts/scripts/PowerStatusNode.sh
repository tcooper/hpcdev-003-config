#!/bin/bash

# Usage:
#  PowerStatusNode.sh <node>

node=$1
ipmi_file=/root/.ipmi

if [ ! -f $ipmi_file ]; then
  ipmi_username="root"
  ipmi_password="root"
  ipmi_key=""
else
  ipmi_username=`awk '/ipmi_username/ {print $2}' $ipmi_file`
  ipmi_password=`awk '/ipmi_password/ {print $2}' $ipmi_file`
  ipmi_key=`awk '/ipmi_key/ {print $2}' $ipmi_file`
fi

# NOTE: The 'real' ipmi username/password must be substituted once this script
#       is installed on the cluster.
ipmi-power -D LAN_2_0 -h $node.ipmi -u $ipmi_username -p $ipmi_password -k $ipmi_key --stat

exit $?
