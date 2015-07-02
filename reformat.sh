#!/bin/bash
#
# Remove process summaries from Brutus output files
#

# Check if output directory already exists. If so, require user to delete it.
OUTDIR=edited
if [ -d "$OUTDIR" ]; then

  echo The directory "<$OUTDIR>" already exists. Please delete it before continuing.
  echo "(Try rm -r \"$OUTDIR\")"
  exit

fi

mkdir "$OUTDIR"

for INFILE in $(ls *.txt); do

  OUTFILE="$OUTDIR/$INFILE"
  # Delete every line which does not start with a number
  # (including empty lines)
  cat "$INFILE" | sed '/^[^0-9]/d' | sed '/^\s*$/d' > "$OUTFILE"

  # Notify user of written lines
  echo Wrote $(cat "$OUTFILE" | wc --lines) lines of data to "$OUTFILE"

done
