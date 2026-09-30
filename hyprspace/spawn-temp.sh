#!/usr/bin/env bash

# Generate a short random name (e.g. tmp-x8k2)
RAND_ID="tmp-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 4)"

# Switch focus directly to the new workspace (creates it automatically)
hyprspace workspace "$RAND_ID"
