# TMUX

1. 3pnl layout build.  

    ```
    new-session -d -s work
    split-window -v -t work:0
    select-pane -D -t work:0
    split-window -h -t work:0
    select-layout -t work:0 main-horizontal
    ```

    :bulb: Save the above in a script `~/my_tmux_layout.conf`. Then you will ... 
      
      <details>
      
      <summary> ... need an existing tmux server/session first:</summary>
      
      Copy/paste the codeblock below in the terminal. 

      ```
      tmux new-session -d -s default 
      tmux source-file ~/my_tmux_layout.conf
      tmux kill-session -t default
      tmux attach -t work
      ```
      </details>
    <br>

 1. Resize windows 
    ```
    resize-pane -U 5
    resize-pane -D 5
    resize-pane -L 5
    resize-pane -R 5
    ```