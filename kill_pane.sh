#!/bin/bash

session=${1}
split=${2}

tmux kill-pane -t ${session}:${split}
