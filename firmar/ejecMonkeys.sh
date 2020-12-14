#!/bin/bash

# directorio para ejecutar adb
cd C:/Users/eduar/AppData/Local/Android/Sdk/platform-tools

# Tareas para cada una de las ejecuciones de los monkeys
# let SEED=1426091421426
for SEED in 1426091421426 2426091421426 3426091421426 4426091421426 5426091421426 6426091421426; do
    echo " ///////////////////////////////////////////////////////////////// "
    echo " / Se inicia la ejecución de los 4500 Mutantes con la Semilla $SEED"
    echo " ///////////////////////////////////////////////////////////////// "


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
    pathLog="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/log_Seed_$SEED.txt"
    echo https://raw.githubusercontent.com/EduarDuarteS/regresionMovilMileage/master/monkeys/mutante$i/log_Seed_$SEED.txt 
    
    if ./adb shell monkey -s $SEED -p com.evancharlton.mileage -v 10000 > $pathLog ; then
        echo "| Mutante$i | Alive | https://github.com/EduarDuarteS/regresionMovilMileage/tree/master/mutantes/com.evancharlton.mileage-mutant$i |" >> C:/Desarrollos/Testing/regresionMovilMileage/monkeys/$SEED.txt
    else
        # Capturar imagen 
        pathScreen="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/screen_kill_mutante$i.png"
        ./adb exec-out screencap -p > $pathScreen
        echo "| Mutante$i | Killed | https://github.com/EduarDuarteS/regresionMovilMileage/tree/master/mutantes/com.evancharlton.mileage-mutant$i |" >> C:/Desarrollos/Testing/regresionMovilMileage/monkeys/$SEED.txt
    fi
    # Capturar imagen 
    pathScreen="C:/Desarrollos/Testing/regresionMovilMileage/monkeys/mutante$i/screen_mutante$i.png"
   ./adb exec-out screencap -p > $pathScreen
   
    echo " ---------------------------------------------------------------------------------- "
    echo " - Finaliza la ejecución del mutante $i con la Semilla $SEED"
    echo " ---------------------------------------------------------------------------------- "

done
    echo " ///////////////////////////////////////////////////////////////// "
    echo " / Se Finaliza la ejecución de los 4500 Mutantes con la Semilla $SEED"
    echo " ///////////////////////////////////////////////////////////////// "
done
# ./adb exec-out screencap -p > screen.png