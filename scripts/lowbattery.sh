#!/usr/bin/env bash

# set Battery
BATTERY1=/sys/class/power_supply/BAT1  # The main battery
BATTERY0=/sys/class/power_supply/BAT0 # The reserve battery

STATUS1=`grep "POWER_SUPPLY_STATUS" $BATTERY1/uevent | cut -d= -f2`
STATUS0=`grep "POWER_SUPPLY_STATUS" $BATTERY0/uevent | cut -d= -f2`

# get remaining energy value
REM1=`grep "POWER_SUPPLY_ENERGY_NOW" $BATTERY1/uevent | cut -d= -f2`
REM0=`grep "POWER_SUPPLY_ENERGY_NOW" $BATTERY0/uevent | cut -d= -f2`

# get full energy value
FULL1=`grep "POWER_SUPPLY_ENERGY_FULL_DESIGN" $BATTERY1/uevent | cut -d= -f2`
FULL0=`grep "POWER_SUPPLY_ENERGY_FULL_DESIGN" $BATTERY0/uevent | cut -d= -f2`

# get current energy value in percent
PERCENT1=`echo $(( $REM1 * 100 / $FULL1 ))`
PERCENT0=`echo $(( $REM0 * 100 / $FULL0 ))`

# set error message
MESSAGE="AWW SNAP! I am running out of juice ...  Please, charge me or I'll have to power down."

# set energy limit in percent
LIMIT="30"

echo BATTERY1
echo STATUS $STATUS1
echo REM $REM1
echo FULL $FULL1
echo PERCENT $PERCENT1
echo ''

echo BATTERY0
echo STATUS $STATUS0
echo REM $REM0
echo FULL $FULL0
echo PERCENT $PERCENT0

if [ "$STATUS0" == "Charging" ]; then
  exit 0
fi

# set limit and show warning
if [ $PERCENT0 -le "$(echo $LIMIT)" ]; then
  DISPLAY=:0.0 /usr/bin/i3-nagbar -m "$(echo $MESSAGE)"
fi

