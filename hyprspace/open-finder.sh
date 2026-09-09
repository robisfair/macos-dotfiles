#!/bin/bash
osascript <<EOF
tell application "Finder"
    make new Finder window to POSIX file "/Users/robert"
    activate
end tell
EOF

