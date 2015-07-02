#!/bin/bash
#
# For each .txt file in the directory (they should be Brutus output)
#   1. Strip the header
#   2. Leave off the first 2 lines of output
#   3. Write the rest of FILENAME to edited/FILENAME
#

OUTDIR=edited
if [ -d $OUTDIR ]; then

  echo The directory "<$OUTDIR>" already exists. Please move or delete it first.
  exit

fi

mkdir $OUTDIR

for INFILE in $(ls *.txt); do

  linenum=0
  outlinenum=0
  OUTPUT_SECTION=false

  # Name of the output file
  OUTFILE=$OUTDIR/$INFILE
  while read LINE; do

    linenum=$(($linenum + 1))
    # If we're in the output portion of the file, then keep track of line no
    if [ "$OUTPUT_SECTION" == true ]; then
      
      # Count one more line of output portion
      outlinenum=$(($outlinenum + 1))  # No spaces around equals!!
      # If we're after the 2nd output line, then we're into the numbers
      if [ "$outlinenum" -gt "2" ]; then
        
        tail -n +"$linenum" "$INFILE" > $OUTFILE
        break

      fi

    # Else if we read a certain phrase, then we're entering the output portion
    elif [[ "$LINE" == "The output (if any) follows:"* ]]; then

      OUTPUT_SECTION=true;

    fi

  done < $INFILE

  echo Wrote $(wc --lines $OUTFILE) data points to $OUTFILE.

done
