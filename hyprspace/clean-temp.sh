#!/usr/bin/env bash

# Define your persistent workspaces matching .aerospace.toml
PERSISTENT=("1" "2" "3" "4" "5" "6" "G")

# 1. Capture where you currently are BEFORE closing anything
INITIAL_WS=$(hyprspace list-workspaces --focused)

# Fetch all active workspaces
ALL_WORKSPACES=$(hyprspace list-workspaces --all)

# 2. Iterate through non-persistent workspaces and close windows gently
for ws in $ALL_WORKSPACES; do
  # If the workspace is NOT in the persistent array
  if [[ ! " ${PERSISTENT[*]} " =~ " ${ws} " ]]; then
    # Fetch all window IDs in this temp workspace
    WINDOWS=$(hyprspace list-windows --workspace "$ws" --format "%{window-id}")

    for win_id in $WINDOWS; do
      # Closes the window gracefully using your preferred flag
      hyprspace close --window-id "$win_id" --quit-if-last-window
    done
  fi
done

# 3. Handle focus return
if [[ " ${PERSISTENT[*]} " =~ " ${INITIAL_WS} " ]]; then
  # You triggered this from a persistent workspace -> stay on it
  hyprspace workspace "$INITIAL_WS"
else
  # You triggered this while INSIDE a temp workspace that just got destroyed -> fallback to 1
  hyprspace workspace 1
fi
