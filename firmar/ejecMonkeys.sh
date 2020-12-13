#!/bin/bash

# directorio para ejecutar adb
cd C:/Users/eduar/AppData/Local/Android/Sdk/platform-tools


for i in $(seq 1 5); do
    echo $i
    pathScreen="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/screen_mutante$i.png"

   ./adb exec-out screencap -p > $pathScreen
    echo $pathScreen
done


# ./adb exec-out screencap -p > screen.png