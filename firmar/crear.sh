cd C:/Desarrollos/Testing/regresionMovilMileage/monkeys

for i in $(seq 1 4500); do
    echo $i
    dirMutante="mutante"$i
    mkdir.exe $dirMutante
done