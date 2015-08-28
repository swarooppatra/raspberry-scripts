#!/bin/bash

remote_host=${1}
remote_port=${2}
local_host=localhost
local_port=65530


tunnel_pid=`ps ax|grep -P "ssh.*?65530" | grep ec2 | awk '{print $1}'`
if [ ! -z "${tunnel_pid}" -a "${tunnel_pid}" != " " ]; then
	`kill -9 ${tunnel_pid}`
fi
ssh -fCNL ${local_port}:${remote_host}:${remote_port} -i /media/82923CF5923CEEF3/project/undertone/keys/staging-interface.pem ec2-user@54.88.66.219
sleep 5
wget --no-verbose ${local_host}:${local_port} -O - | mplayer -msglevel all=-1 MPLAYER_VERBOSE=-1 -
