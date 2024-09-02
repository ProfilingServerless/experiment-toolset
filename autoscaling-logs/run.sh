#!/usr/bin/bash

set -x

# The experiment is for 480 seconds
# No warmup, starts with steady 20 RPS load. 
# Then the truoghput will change at 300th second and logs are recorded for 90 seconds.
# so we start recording and 295th for 105s to ensure we coverd all proccess. (5 second setup time and 10 seconds hold time)

./clean.sh mghgm@hp167.utah.cloudlab.us mghgm@hp164.utah.cloudlab.us mghgm@hp196.utah.cloudlab.us mghgm@hp197.utah.cloudlab.us mghgm@hp166.utah.cloudlab.us

tmux new-session -d -s "exp" "cd ~/loader && go run cmd/loader.go --config=cmd/config.json"

# waiting for load generator to start
sleep 5

./record.sh 0 30 mghgm@hp167.utah.cloudlab.us mghgm@hp164.utah.cloudlab.us mghgm@hp196.utah.cloudlab.us mghgm@hp197.utah.cloudlab.us mghgm@hp166.utah.cloudlab.us
