# Bin Directory Scripts

This directory contains several useful scripts to manage projects and sessions.

## Requirements
- `fzf`: A command-line fuzzy finder.
- `git`: A version control system.
- `tmux`: A terminal multiplexer.

## Scripts

### d-ready-parent
- Executes a `.d-ready` script if it exists in the current or home directory.

### doit
- Lists all directories inside `$HOME/projects` using `find`.
- Allows interactive fuzzy searching with `fzf` to select a project.
- Manages `tmux` sessions for the selected project, creating a new session if one doesn't exist.

### newproj
- Creates a new project directory under `$HOME/projects`.
- Initializes a git repository in the new project directory.
- Sets up a `.gitignore` file using templates from Toptal's gitignore API.
- Creates an executable `.d-ready` script.
- Manages `tmux` sessions for the new project, creating a new session if one doesn't exist.
