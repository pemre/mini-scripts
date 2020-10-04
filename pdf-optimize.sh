#!/bin/bash
#
# Author:      Emre Piskin
# E-mail:      piskin.emre@gmail.com
# Vers:        1.0.0
# Description: Script to optimize & compress selected pdf file using Ghostscript
#

# Exit function in case of a missing dependency
exitDependency() {
  echo >&2 "Dependency error: '$1' not found. Aborting."
  exit 1
}

# Check dependencies
command -v zenity  >/dev/null 2>&1 || exitDependency "zenity"
command -v gs      >/dev/null 2>&1 || exitDependency "gs"

# Select file
selectedFile=`/usr/bin/zenity  \
    --title='Select a pdf file to optimize'  \
    --file-selection \
    --file-filter=*.pdf`

# Start optimizing
if [ $? -eq 0 ]; then
  fileWithoutExtension=${selectedFile%.*}
  gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -sOutputFile=$fileWithoutExtension.optimized.pdf $selectedFile
  echo File optimized
else
  echo Cancel selected
  exit 0
fi
