#!/bin/bash

session=${1}
split=${2}

tmux send-keys -t ${session}:${split} 'stty size' Enter
