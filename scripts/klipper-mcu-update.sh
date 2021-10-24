#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "ERROR: Please run as root"
  exit
fi

update_rpi() {
    echo "Updating RPi"
    ../boards/rpi/make-and-flash-mcu.sh
}

update_octopus_pro_446() {
    if [[ -h "/dev/btt-octopus-pro-446" ]]
    then
        echo "Octopus Pro 446 detected"
        ../boards/btt-octopus-pro-446/make-and-flash-mcu.sh
    fi
}

update_octopus_pro_429() {
    if [[ -h "/dev/btt-octopus-pro-429" ]]
    then
        echo "Octopus Pro 429 detected"
        ../boards/btt-octopus-pro-429/make-and-flash-mcu.sh
    fi
}

update_btt_octopus_11() {
    if [[ -h "/dev/btt-octopus-11" ]]
    then
        echo "Octopus v1.1 detected"
        ../boards/btt-octopus-11/make-and-flash-mcu.sh
    fi
}

update_fysetc_spider() {
    if [[ -h "/dev/fysetc-spider" ]]
    then
        echo "Fysetc Spider v1.1 detected"
        ../boards/fysetc-spider/make-and-flash-mcu.sh
    fi
}

update_skr_pro_12() {
    if [[ -h "/dev/btt-skr-pro-12" ]]
    then
        echo "SKR Pro v1.2 detected"
        ../boards/btt-skr-pro-12/make-and-flash-mcu.sh
    fi
}

# Force script to exit if an error occurs
set -e

# Run make scripts for the supported boards.
update_rpi
update_octopus_pro_446
update_octopus_pro_429
update_btt_octopus_11
update_fysetc_spider
update_skr_pro_12