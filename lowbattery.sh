#!/usr/bin/env bash

# set Battery
BATTERY=/sys/class/power_supply/BAT1

# get remaining energy value
REM=`grep "POWER_SUPPLY_ENERGY_NOW" $BATTERY/uevent | cut -d= -f2`

# get full energy value
FULL=`grep "POWER_SUPPLY_ENERGY_FULL_DESIGN" $BATTERY/uevent | cut -d= -f2`

# get current energy value in percent
PERCENT=`echo $(( $REM * 100 / $FULL ))`

# set error message
MESSAGE="AWW SNAP! I am running out of juice ...  Please, charge me or I'll have to power down."

# set energy limit in percent
LIMIT="15"

# set limit and show warning
if [ $PERCENT -le "$(echo $LIMIT)" ]; then
  DISPLAY=:0.0 /usr/bin/i3-nagbar -m "$(echo $MESSAGE)"
fi
