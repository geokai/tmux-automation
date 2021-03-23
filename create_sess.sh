#!/bin/bash

session=${1}


cd $HOME

if ! tmux has-session -t ${session}
then
    tmux new -s ${session} -d

    # create the windows & panes:
    tmux split-window -t ${session}:1 -h -l 58
    tmux split-window -t ${session}:1.2
    tmux select-pane -t ${session}:1.2
    # tmux resize-pane -t ${session}:1.2 -x 58 -x 36 
    tmux select-pane -t ${session}:1.3

else
    tmux attach -t ${session}
fi
