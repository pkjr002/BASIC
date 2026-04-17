# tmux Usage Guide and Quick Commands

A practical guide to `tmux` for remote-server work, persistent terminal sessions, pane layouts, and daily commands.

---

## Table of Contents

1. [What `tmux` is](#what-tmux-is)
2. [Where `tmux` lives](#where-tmux-lives)
3. [`tmux` vs iTerm2](#tmux-vs-iterm2)
4. [Why `tmux` is useful](#why-tmux-is-useful)
5. [Main ideas to remember](#main-ideas-to-remember)
6. [Sessions, windows, and panes](#sessions-windows-and-panes)
7. [Quick start](#quick-start)
8. [Daily commands cheatsheet](#daily-commands-cheatsheet)
9. [Common pane layouts](#common-pane-layouts)
10. [Resizing panes](#resizing-panes)
11. [Scrolling in `tmux`](#scrolling-in-tmux)
12. [Using multiple laptops with the same `tmux` session](#using-multiple-laptops-with-the-same-tmux-session)
13. [What happens on server reboot](#what-happens-on-server-reboot)
14. [How to preserve layouts](#how-to-preserve-layouts)
15. [Useful `.tmux.conf` starter config](#useful-tmuxconf-starter-config)
16. [Recommended workflow for remote servers](#recommended-workflow-for-remote-servers)
17. [Fast reference card](#fast-reference-card)

---

# What `tmux` is

`tmux` is a **terminal multiplexer**.

It lets one terminal session contain multiple:

- shell sessions
- windows
- panes

and those sessions can keep running even if:

- your SSH connection drops
- you close your laptop
- you detach and reconnect later

That is why it is so useful for remote Linux servers.

A common workflow is:

1. SSH into a server
2. Start `tmux`
3. Run work inside it
4. Detach from `tmux`
5. Disconnect from SSH
6. Reconnect later and reattach

As long as the server stays up, your `tmux` session keeps running.

---

# Where `tmux` lives

`tmux` runs on **the machine where you started it**.

Examples:

- Start `tmux` on your **Ubuntu server** → the session lives on that server
- Start `tmux` on your **Mac** → it lives on your Mac
- Start `tmux` inside a **Docker container** → it lives inside that container

So if you SSH from your Mac into a Linux server and run `tmux` there, the `tmux` session lives on the **Linux server**, not on your Mac.

---

# `tmux` vs iTerm2

These are different things.

## iTerm2

iTerm2 is a **terminal application** on your Mac.

It gives you:

- tabs
- split panes
- profiles
- terminal UI features

But iTerm2 itself does **not** provide a persistent remote session.

## `tmux`

`tmux` is a **persistent terminal workspace** that runs on the host machine.

It gives you:

- persistent sessions
- multiple windows and panes
- detach / reattach
- survival across SSH disconnects

## Best combination

A very common setup is:

- **iTerm2** on your Mac
- **SSH** into your Linux server
- **`tmux`** running on the Linux server

This is a strong combination:

- iTerm2 = the nice local terminal frontend
- `tmux` = the persistent remote workspace

---

# Why `tmux` is useful

`tmux` is popular because it solves real terminal problems.

## 1. Persistent sessions

If your Wi-Fi drops or you close your laptop, your remote work can keep running.

## 2. Organized terminal workspace

You can have:

- one pane for logs
- one pane for code
- one pane for monitoring
- one pane for commands

## 3. Great for remote servers

You can detach and later reconnect from the same laptop or a different laptop.

## 4. Keyboard-driven and fast

Once learned, it becomes a very efficient workflow.

## 5. Lightweight

It does not need a heavy GUI.

---

# Main ideas to remember

## `tmux` protects against disconnects, not reboots

`tmux` is great for:

- SSH disconnects
- closing the local terminal
- switching laptops

`tmux` does **not** protect against:

- server reboot
- power loss
- kernel panic

If the server reboots, the `tmux` session is gone by default.

## Detach is not the same as exit

- **Detach** leaves the session running
- **Exit** closes the shell in the current pane

## `tmux` is a shared workspace

If two clients attach to the same `tmux` session, they are both viewing and controlling the same session.

---

# Sessions, windows, and panes

`tmux` has three levels.

## Sessions

A session is the main persistent workspace.

## Windows

A window is like a tab inside a session.

## Panes

A pane is a split inside a window.

Structure:

```text
session
  ├── window 1
  │     ├── pane
  │     └── pane
  ├── window 2
  │     └── pane
  └── window 3
```

---

# Quick start

## Start a named session

```bash
tmux new -s work
```

## List sessions

```bash
tmux ls
```

## Attach to a session

```bash
tmux attach -t work
```

## Detach without stopping it

Press:

```text
Ctrl-b d
```

## Kill one session

```bash
tmux kill-session -t work
```

## Kill all sessions

```bash
tmux kill-server
```

---

# Default prefix key

Most `tmux` commands begin with the prefix:

```text
Ctrl-b
```

That means:

1. Press `Ctrl-b`
2. Release
3. Press the next key

---

# Daily commands cheatsheet

## Sessions

### Start a new session

```bash
tmux
tmux new -s mysession
```

### List sessions

```bash
tmux ls
```

### Attach to a session

```bash
tmux attach -t mysession
```

### Attach to the most recent session

```bash
tmux a
```

### Rename current session

```text
Ctrl-b $
```

### Switch sessions interactively

```text
Ctrl-b s
```

### Kill current session from inside `tmux`

```text
Ctrl-b :kill-session
```

### Kill a session from the shell

```bash
tmux kill-session -t mysession
```

### Kill all sessions

```bash
tmux kill-server
```

---

## Windows

A window is like a tab inside `tmux`.

### New window

```text
Ctrl-b c
```

### Next window

```text
Ctrl-b n
```

### Previous window

```text
Ctrl-b p
```

### Choose window interactively

```text
Ctrl-b w
```

### Select by number

```text
Ctrl-b 0
Ctrl-b 1
Ctrl-b 2
...
```

### Rename current window

```text
Ctrl-b ,
```

### Kill current window

```text
Ctrl-b &
```

---

## Panes

### Split left / right

```text
Ctrl-b %
```

### Split top / bottom

```text
Ctrl-b "
```

### Move between panes

```text
Ctrl-b + arrow keys
```

### Show pane numbers

```text
Ctrl-b q
```

### Kill current pane

```text
Ctrl-b x
```

### Close pane by exiting shell

```bash
exit
```

or:

```text
Ctrl-d
```

### Zoom / unzoom current pane

```text
Ctrl-b z
```

### Swap pane positions

```text
Ctrl-b }
Ctrl-b {
```

---

## Detach and reattach

### Detach

```text
Ctrl-b d
```

### Reattach later

```bash
tmux attach -t mysession
```

---

# Common pane layouts

## One top pane, two bottom panes

This is the layout you asked about:

```text
+---------------------------+
|            top            |
+-------------+-------------+
| bottom-left | bottom-right|
+-------------+-------------+
```

## How to create it

From a single pane:

1. Split into top and bottom:

```text
Ctrl-b "
```

2. Move to the bottom pane:

```text
Ctrl-b Down
```

3. Split the bottom pane into left and right:

```text
Ctrl-b %
```

---

## Built-in layout presets

Use command mode:

```text
Ctrl-b :
```

Then run one of these.

### One large pane on top, smaller panes below

```bash
select-layout main-horizontal
```

### One large pane on left, smaller panes on right

```bash
select-layout main-vertical
```

### Even top/bottom

```bash
select-layout even-horizontal
```

### Even left/right

```bash
select-layout even-vertical
```

### Grid / tiled layout

```bash
select-layout tiled
```

---

# Resizing panes

## Keyboard resize

Depending on terminal support, these may work:

```text
Ctrl-b Ctrl-Up
Ctrl-b Ctrl-Down
Ctrl-b Ctrl-Left
Ctrl-b Ctrl-Right
```

## Reliable method: command mode

Press:

```text
Ctrl-b :
```

Then type:

```bash
resize-pane -U 5
resize-pane -D 5
resize-pane -L 5
resize-pane -R 5
```

Examples:

```bash
resize-pane -U 10
resize-pane -D 10
resize-pane -L 5
resize-pane -R 5
```

---

# Scrolling in `tmux`

A common confusion is: **why can I not scroll the terminal normally inside `tmux`?**

Because `tmux` maintains its own scrollback/history buffer.

Also, if you are inside programs like:

- `vim`
- `less`
- `man`
- `htop`
- `nano`
- `ranger`

those programs may capture scrolling themselves.

## Standard way to scroll: copy mode

Press:

```text
Ctrl-b [
```

Then use:

- arrow keys
- Page Up / Page Down
- `/` to search
- `q` to quit copy mode

## Another shortcut

```text
Ctrl-b PageUp
```

often jumps into scrollback.

## Enable mouse support

Put this in `~/.tmux.conf`:

```bash
set -g mouse on
```

Then reload:

```bash
tmux source-file ~/.tmux.conf
```

## Increase history size

Also useful:

```bash
set -g history-limit 50000
```

## Check whether mouse is on

```bash
tmux show -g mouse
```

---

# Using multiple laptops with the same `tmux` session

Yes — **multiple laptops can attach to the same `tmux` session at the same time**.

Example:

1. Laptop A SSHes into the server and attaches to session `work`
2. Laptop B SSHes into the same server and also attaches to session `work`

Now both laptops are attached to the same live session.

## What that means

Both attached clients can:

- see the same session
- move through windows and panes
- type commands
- detach independently

## Important caution

This is a **shared workspace**, not two isolated copies.

If both laptops are in the **same pane**, they can both type into the same shell, which can get messy.

## Safe use

Best use cases:

- one laptop watches logs
- another checks another pane or window
- both attach to monitor the same running job

## Risky use

- both typing in the same pane at the same time

## Useful commands

### Attach normally

```bash
tmux attach -t work
```

### See attached clients

```bash
tmux list-clients
```

### Attach and force-detach other clients

```bash
tmux attach -d -t work
```

This is useful if you want to take over the session from another laptop.

---

# What happens on server reboot

If the **server restarts**, the `tmux` server on that machine restarts too.

That means:

- all `tmux` sessions are terminated
- running processes inside those panes usually stop
- after reboot, the old `tmux` session is gone

## Before rebooting

It is a good idea to:

### 1. Check what sessions exist

```bash
tmux ls
```

### 2. Reattach to important sessions

```bash
tmux attach -t work
```

### 3. Save or stop important work

Examples:

- save files in editors
- stop long jobs cleanly if needed
- note working directories and commands
- confirm transfers are complete

### 4. Detach or exit

```text
Ctrl-b d
```

## After reboot

You create a new session again:

```bash
tmux new -s work
```

---

# How to preserve layouts

There are several cases.

## Case 1: Just detach and later reattach

If the session stays alive, you do not need to save the layout separately.

Your:

- session
- windows
- panes
- current layout

all remain as they are while `tmux` is still running.

## Case 2: Save a reusable layout shape

You can use built-in layout presets like:

- `main-horizontal`
- `main-vertical`
- `even-horizontal`
- `even-vertical`
- `tiled`

These are great when you want to quickly restore a familiar pane arrangement.

Example:

```bash
tmux select-layout main-horizontal
```

That gives one large top pane and smaller panes below.

## Case 3: Rebuild a layout after `tmux` dies or after reboot

The simplest reliable method is a small tmux script.

Example:

```bash
tmux new-session -d -s work
tmux split-window -v -t work:0
tmux select-pane -D -t work:0
tmux split-window -h -t work:0
tmux select-layout -t work:0 main-horizontal
```

Then run it or source it from a file.

## Useful command

```bash
tmux source-file ~/my_tmux_layout.conf
```

## Plugin option

If you want more automation, people often use:

- `tmux-resurrect`
- `tmux-continuum`

These can help save and restore sessions and pane arrangements after the tmux server dies, though they are extra tools, not built into plain tmux.

## Important reminder

Even if you restore layout, plain `tmux` alone does **not** guarantee that running jobs survive a reboot.

For reboot-safe jobs, use things like:

- `systemd`
- `nohup`
- Docker restart policies
- job schedulers / service managers

---

# Useful `.tmux.conf` starter config

Here is a simple, practical starter config.

```tmux
set -g mouse on
set -g history-limit 50000
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on
```

## What these do

- `mouse on` → lets you click panes and scroll more naturally
- `history-limit 50000` → larger scrollback
- `base-index 1` → windows start at 1 instead of 0
- `pane-base-index 1` → panes start at 1 instead of 0
- `renumber-windows on` → window numbers stay tidy after closing windows

## Reload config

```bash
tmux source-file ~/.tmux.conf
```

---

# Recommended workflow for remote servers

For your use case, a strong standard workflow is:

1. Open iTerm2 on your Mac
2. SSH into the Linux server
3. Start or attach to `tmux`
4. Use panes/windows for organization
5. Detach when done
6. Reattach later from the same or another laptop

Example:

```bash
ssh yourserver
tmux new -s work
```

Then inside `tmux`, you might use:

- pane 1: run model or script
- pane 2: watch logs
- pane 3: check files
- pane 4: monitor CPU / memory

Detach:

```text
Ctrl-b d
```

Later:

```bash
ssh yourserver
tmux attach -t work
```

---

# Good habits in `tmux`

## For long-running work

Run long jobs inside `tmux`, not in a plain SSH shell.

## For monitoring

Use separate panes for:

- logs
- shell commands
- system monitoring

## For multiple devices

It is fine to attach from another laptop, but avoid typing into the same pane from both machines.

## Before rebooting a server

Do not assume `tmux` will save your work through reboot. Check sessions and stop or save important work first.

---

# Fast reference card

## Start / attach

```bash
tmux new -s work
tmux ls
tmux attach -t work
tmux a
```

## Detach

```text
Ctrl-b d
```

## Sessions

```text
Ctrl-b s
Ctrl-b $
```

```bash
tmux kill-session -t work
tmux kill-server
```

## Windows

```text
Ctrl-b c
Ctrl-b n
Ctrl-b p
Ctrl-b w
Ctrl-b ,
Ctrl-b &
```

## Panes

```text
Ctrl-b "
Ctrl-b %
Ctrl-b + arrow keys
Ctrl-b q
Ctrl-b x
Ctrl-b z
```

## Resize

```text
Ctrl-b :
resize-pane -U 5
resize-pane -D 5
resize-pane -L 5
resize-pane -R 5
```

## Scrollback

```text
Ctrl-b [
Ctrl-b PageUp
q
Ctrl-b ]
```

## Multi-client

```bash
tmux list-clients
tmux attach -d -t work
```

## Reload config

```bash
tmux source-file ~/.tmux.conf
```

---

# One-sentence summary

`tmux` is a persistent terminal workspace that runs on the host machine, lets you organize shells into windows and panes, and lets you disconnect and reconnect without losing your session as long as the host itself stays up.