#! /usr/bin/env bash
echo "Hello logfile - runcommand-onstart checking in here" >&2
#START DOSBOX SECTION - SNIP CONTENTS IF PASTING INTO EXISTING SCRIPT
if [ $2 = "dosbox" ]
then
   # dosbox detected - changing video mode to special low resolution fallback mode
   # check available modes with 'tvservice -m DMT' (or CEA)
   tvservice -e "CEA 17"
   clear
fi
#END DOSBOX SECTION
# the line below is needed to use the joystick selection by name method
bash "/opt/retropie/supplementary/joystick-selection/js-onstart.sh" "$@"
