# TMUX
**tmux** is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen.  

## Installation
```bash
sudo apt-get install tmux
```

## Usage
```bash
tmux
```

## Commands
- `tmux new -s session_name`: Create a new session
- `tmux ls`: List all sessions
- `tmux attach -t session_name`: Attach to a session
- `tmux kill-session -t session_name`: Kill a session
- `tmux kill-server`: Kill the server
- `tmux rename-session -t old_session_name new_session_name`: Rename a session
- `tmux new-window -n window_name`: Create a new window
- `tmux select-window -t window_name`: Select a window
- `tmux list-windows`: List all windows
- `tmux rename-window -t old_window_name new_window_name`: Rename a window
- `tmux split-window -h`: Split a window horizontally
- `tmux split-window -v`: Split a window vertically
- `tmux swap-window -s window_name1 -t window_name2`: Swap windows
- `tmux kill-window -t window_name`: Kill a window
- `tmux send-keys -t session_name:window_name.0 "command"`: Send a command to a window
- `tmux send-keys -t session_name:window_name.0 C-c`: Send a `Ctrl+C` to a window
- `tmux send-keys -t session_name:window_name.0 Enter`: Send an `Enter` to a window
- `tmux new-session -d -s "session_name" -n "window_name"`: Create a new session and a window with names  

## Key Bindings
- `prefix + c`: Create a new window
- `prefix + n`: Move to the next window
- `prefix + p`: Move to the previous window
- `prefix + (`: Move to the previous session
- `prefix + )`: Move to the next session
- `prefix + d`: Detach from a session
- `prefix + w`: List all windows and sessions
- `prefix + ,`: Rename a window
- `prefix + %`: Split a window horizontally
- `prefix + "`: Split a window vertically
- `prefix + x`: Kill a window
- `prefix + z`: Zoom in/out a window
- `prefix + #`: Enter # window  

