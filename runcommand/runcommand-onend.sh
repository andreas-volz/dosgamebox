#! /usr/bin/env bash
echo "Hello logfile - runcommand-onend checking in here" >&2
#START DOSBOX SECTION - SNIP HERE IF PASTING INTO EXISITNG SCRIPT
if [ $2 = "dosbox" ]
then
    #Reverting display back to preferred mode
    tvservice -p
fi
#END DOSBOX SECTION
