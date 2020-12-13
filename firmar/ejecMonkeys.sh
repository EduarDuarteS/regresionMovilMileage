#!/bin/bash

# directorio para ejecutar adb
cd C:/Users/eduar/AppData/Local/Android/Sdk/platform-tools

# Tareas para cada una de las ejecuciones de los monkeys
let SEED=1426091421426
for i in $(seq 1 4500); do

    echo " ################################################################################# "
    echo " # Inicia la ejecución del mutante $i con la Semilla $SEED"
    echo " ################################################################################# "

    
    pathMutante="C:/Desarrollos/Testing/regresionMovilMileage/mutantes/com.evancharlton.mileage-mutant$i/"


    # Desinstallar la apk  
    echo "Desinstallar la apk com.evancharlton.mileage"
    ./adb uninstall com.evancharlton.mileage
    
    echo "Installar la apk com.evancharlton.mileage"
    # Installar la apk
    ./adb install $pathMutante/com.evancharlton.mileage_3110-aligned-debugSigned.apk

    # Dar el mismo inicio en el home
    ./adb shell input keyevent KEYCODE_HOME

    # Ejecutar monkeys
    pathLog="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/log.txt"
    echo $pathLog 
    
    if ./adb shell monkey -s $SEED -p com.evancharlton.mileage -v 10000 > $pathLog ; then
        echo "| Mutante$i | Killed | https://github.com/EduarDuarteS/regresionMovilMileage/tree/master/mutantes/com.evancharlton.mileage-mutant$1 |" >> C:/Desarrollos/Testing/regresionMovilMileage/monkeys/$SEED.txt
    else
        echo "| Mutante$i | Alive | https://github.com/EduarDuarteS/regresionMovilMileage/tree/master/mutantes/com.evancharlton.mileage-mutant$1 |" >> C:/Desarrollos/Testing/regresionMovilMileage/monkeys/$SEED.txt
    fi
    # Capturar imagen 
    pathScreen="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/screen_mutante$i.png"
   ./adb exec-out screencap -p > $pathScreen
   
    echo " ---------------------------------------------------------------------------------- "
    echo " - Finaliza la ejecución del mutante $i con la Semilla $SEED"
    echo " ---------------------------------------------------------------------------------- "

done


# ./adb exec-out screencap -p > screen.png