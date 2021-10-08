#!/bin/bash
# screen_gtf es la salida de
#   >gtf 1920 1200 60 || gtf 1280 800 60
# El string screen_gtf equivale a la entrada con commilas,
#   >xrandr --newmode "1920x1200_60.00" 193.16 ...
# Si se le dejan las commilas la entrada en xrandr es erronea.

# screen='1920x1200_60.00'
# screen_gtf='1920x1200_60.00 193.16 1920 2048 2256 2592 1200 1201 1204 1242 -HSync +Vsync'

screen='1280x800_60.00'
screen_gtf='1280x800_60.00 83.46 1280 1344 1480 1680 800 801 804 828 -HSync +Vsync'

function start(){
    echo "Starting..."
    xrandr --newmode $screen_gtf
    xrandr --addmode VIRTUAL1 $screen
    xrandr --output VIRTUAL1 --mode $screen --left-of LVDS1
}

function stop() {
    echo "Stopping..."
    xrandr --output VIRTUAL1 --off
    xrandr --delmode VIRTUAL1 $screen
    xrandr --rmmode $screen
}

function show_help() {
    echo "virtual-mon [start | stop]"
    echo "start: inicia monitor virtual basado en xrandr"
    echo "stop:  detiene y elimina el monitor virtual"
}


echo $screen
echo $screen_gtf


if [ $# = 0 ]; then
    show_help
elif [ $# -eq 1 ]; then
    if [ $1 = start ]; then
        start
    elif [ $1 = stop ]; then
        stop
    elif [ $1 = help ]; then
        show_help
    else
        echo "'$1' no es un argumento válido. Consulte virtual-mon help"        
    fi
else
    echo "Error. Se espera solo 1 argumento"
fi