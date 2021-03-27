#!/bin/bash

session=${1}
split=${2}
orient=${3}
size=${4}


cd $HOME


tmux split-pane -t ${session}:1 -h
tmux split-pane -t ${session}:1.1
tmux split-pane -t ${session}:1.3
tmux resize-pane -t ${session}:1.3 -x 58 -y 36
tmux resize-pane -t ${session}:1.2 -y 8
tmux split-pane -t ${session}:1.2 -h

# pane :1.5
sleep 2
tmux send-keys -t ${session}:1.5 "cd ~/bin/home_weather_station" Enter
tmux send-keys -t ${session}:1.5 "pipenv run python receive_socket.py" Enter

# pane :1.1 (background process)
sleep 2
tmux send-keys -t ${session}:1.1 "cd ~/bin/pi_cpu-tmp" Enter
tmux send-keys -t ${session}:1.1 "pipenv run bash pi_bme.sh &" Enter
tmux select-pane -t ${session}:1.1
tmux send-keys -t ${session}:1.1 "jobs -l" Enter

# pane :1.2 & :1.3
sleep 2
tmux send-keys -t ${session}:1.2 "cd ~/bin/RPI_Utils/Processor_Temperature" Enter
tmux send-keys -t ${session}:1.2 "pipenv run python cpu_mem.py" Enter
tmux send-keys -t ${session}:1.3 "cd ~/bin/RPI_Utils/Processor_Temperature" Enter
tmux send-keys -t ${session}:1.3 "pipenv run python cpu_temp02.py" Enter

# pane :1.4
sleep 2
tmux send-keys -t ${session}:1.4 "cd ~/bin/darksky_weather" Enter
tmux send-keys -t ${session}:1.4 "./entr_dark.sh" Enter

# pane :1.1 (foreground process)
sleep 60
tmux send-keys -t ${session}:1.1 Enter
tmux send-keys -t ${session}:1.1 "htop -d 50" Enter
sleep 5
tmux send-keys -t ${session}:1.1 "u pi" Enter
