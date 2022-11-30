#!/bin/sh
cfiles=$(ls *.c)
makefilecontent=""
ofiles=""
for file in ${cfiles[@]}
do
    dependencies=$(grep -P '#include[\s]*".*"' $file | cut -d'"' -f2)
    filename=$(echo $file | cut -d'.' -f1)
    makefilecontent+="$filename.o: $file" 
    for dep in ${dependencies[@]}
    do
        makefilecontent+=" $dep"
    done
    makefilecontent+="\n\tcc -c $file\n\n"
    ofiles+="$filename.o "
done
# remove last character
ofiles=$(echo $ofiles | sed 's/$//')
makefilecontent=$(echo $makefilecontent | sed 's/..$//')
makefilecontent="a.out: $ofiles\n\tcc $ofiles -o a.out\n\n$makefilecontent"
makefilecontent+="\nclean:\n\trm -f *.o a.out\n"
printf "$makefilecontent" > Makefile