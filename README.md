# virtual-screen
Procedimiento para crear un escritorio virtual y utilizar android como pantalla secundaria.
Probado bajo X11, Gnome 40, Manjaro. Android 11.
Se recomienda crear un link simbólico para ejecutar sin buscar el directorio.
```bash
ln virtual-mon.sh /usr/bin/virtual-mon.sh
```

## Using script
```
virtual-mon [start | stop]

start:  inicia monitor virtual basado en xrandr
stop:   detiene y elimina el monitor virtual
ethon:  inicia el anclaje de red por usb (android usb tethering)
ethoff: detiene el servicio de red por usb.
help:   muestra este mensaje de ayuda
```

## Launch USB tethering
Probado con Android 11.
Lanzar anclaje de red por usb.
```bash
./virtual-mon.sh ethon
```
Detiene anclaje de red por usb.
```bash
./virtual-mon.sh ethoff
```
Requiere `android-tools`. En arch `sudo pacman -S android-tools`

## Launch virtual monitor
Con Deskreen se obtiene una url con ip y puerto para utilizar. Utilizando adb, se lanza un navegador para visualizar el monitor.
```bash 
adb shell am start -a android.intent.action.VIEW -d 'http://ip:port/page'
```

# TODO
- Agregar commando para ingresar resolución alternativa.
    - Agregar definicion en las sentencias de CLI.
    - Wrappear la salida de gtf.
- Agregar comando para lanzar web por CLI.
    - Ver si Deskreen tiene cliente CLI para obtener la url.
