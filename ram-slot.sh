#!/bin/bash
#
# Author:      Emre Piskin
# E-mail:      piskin.emre@gmail.com
# Vers:        1.0.0
# Description: Script to show how many RAM slots computer has
#

# Exit function in case of a missing dependency
exitDependency() {
  echo >&2 "Dependency error: '$1' not found. Aborting."
  exit 1
}

# Check dependencies
command -v sudo >/dev/null 2>&1 || exitDependency "sudo"
command -v lshw >/dev/null 2>&1 || exitDependency "lshw"
command -v awk  >/dev/null 2>&1 || exitDependency "awk"

# Show slots, 
sudo lshw -class memory | awk '/bank/ {count++} END {print "You have " count "slots for RAM"}'
