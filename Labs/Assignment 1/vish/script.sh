rm -f Makefile
echo "all: a.out" >> Makefile

oFiles=()
for filename in *.c
do
    
    oldIFS=$IFS

    grep -P '#include[ \t]*"' $filename > temp_file

    IFS='"'
    dependencies=()
    while read line
    do
        read -a splittedArray <<< $line
        dependencies+=(${splittedArray[1]})
    done < temp_file
    IFS=$oldIFS

    
    IFS='.'
    read -a splittedArray <<< $filename
    filenameWithoutExtension=${splittedArray[0]}
    IFS=$oldIFS

    #echo $filenameWithoutExtension
    oFiles+=($filenameWithoutExtension'.o')

    echo -n "$filenameWithoutExtension.o: $filename " >> Makefile
    for dependency in "${dependencies[@]}"
    do
        echo -n "$dependency " >> Makefile
    done
    
    echo >> Makefile

    echo -e "\tgcc -Wall -c $filename" >> Makefile
done

rm temp_file

echo -n "a.out: " >> Makefile
for oFile in "${oFiles[@]}"
do
    echo -n "$oFile " >> Makefile
done

echo >> Makefile

echo -e -n "\tgcc -Wall " >> Makefile
for oFile in "${oFiles[@]}"
do
    echo -n "$oFile " >> Makefile
done
echo >> Makefile
