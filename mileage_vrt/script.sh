#!/bin/bash

for i in $(seq 1 4500); do
    echo $i
    dirMutante="mutante"$i
    cd C:/Users/docto/AppData/Local/Android/Sdk/platform-tools

    pathMutante="C:/Users/docto/Documents/Trabajos/Uniandes/Semestre 3/Pruebas Automáticas/Parcial 2/mutantes/com.evancharlton.mileage-mutant$i"
    ./adb.exe install C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mutantes/com.evancharlton.mileage-mutant$i/com.evancharlton.mileage_3110-aligned-debugSigned.apk

    ./adb.exe shell am start -n com.evancharlton.mileage/.Mileage

    ./adb.exe shell input tap 150 150
    sleep 1
    ./adb.exe exec-out screencap -p > 1_$dirMutante.png
    ./adb.exe shell input tap 350 150
    sleep 1
    ./adb.exe exec-out screencap -p > 2_$dirMutante.png
    ./adb.exe shell input tap 550 150
    sleep 1
    ./adb.exe exec-out screencap -p > 3_$dirMutante.png
    ./adb.exe shell input tap 850 150
    sleep 1
    ./adb.exe exec-out screencap -p > 4_$dirMutante.png

    mv 1_$dirMutante.png C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mileage_vrt/fullscreenshots/1_$dirMutante.png
    mv 2_$dirMutante.png C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mileage_vrt/fullscreenshots/2_$dirMutante.png
    mv 3_$dirMutante.png C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mileage_vrt/fullscreenshots/3_$dirMutante.png
    mv 4_$dirMutante.png C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mileage_vrt/fullscreenshots/4_$dirMutante.png

    cd C:/Users/docto/Documents/Trabajos/Uniandes/Semestre\ 3/Pruebas\ Automáticas/Parcial\ 2/mileage_vrt
    npm start original_screenshots/original1.png fullscreenshots/1_$dirMutante.png diffscreenshots/1_$dirMutante.png $i
    npm start original_screenshots/original2.png fullscreenshots/2_$dirMutante.png diffscreenshots/2_$dirMutante.png $i
    npm start original_screenshots/original3.png fullscreenshots/3_$dirMutante.png diffscreenshots/3_$dirMutante.png $i
    npm start original_screenshots/original4.png fullscreenshots/4_$dirMutante.png diffscreenshots/4_$dirMutante.png $i

    cd C:/Users/docto/AppData/Local/Android/Sdk/platform-tools
    ./adb.exe uninstall com.evancharlton.mileage
done
