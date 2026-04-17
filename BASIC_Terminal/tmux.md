# TMUX

1. 3pnl layout build.  

    ```
    tmux new-session -d -s work
    tmux split-window -v -t work:0
    tmux select-pane -D -t work:0
    tmux split-window -h -t work:0
    tmux select-layout -t work:0 main-horizontal
    ```

    :bulb: You can load the script via `tmux source-file ~/my_tmux_layout.conf`
    <br>

 1. Resize windows 
    ```
    resize-pane -U 5
    resize-pane -D 5
    resize-pane -L 5
    resize-pane -R 5
    ```