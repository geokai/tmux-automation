#!/bin/bash

session=${1}


cd $HOME

if ! tmux has-session -t ${session}
then
    tmux new -s ${session} -d -x 191 -y 53

else
    tmux attach -t ${session}
fi
