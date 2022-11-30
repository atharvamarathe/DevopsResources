#!/bin/sh
cfiles=$(ls *.c)
makefilecontent=""

is_64=""
if [[ `getconf LONG_BIT` == "64" ]]; then
    is_64=1
fi

is_header=""
for file in ${cfiles[@]}
do
    datatype_dependencies=$(grep -P '#include[\s]*<.*>' $file | cut -d '<' -f2 | cut -d '>' -f1)

    for dep in ${datatype_dependencies[@]}
    do
        if [[ "$dep" == "ints.h" ]]; then
            is_header=1
            break
        fi
    done

    if [[ $is_header ]]; then
        break
    fi
done

if [[ $is_header ]]; then
    if [[ $is_64 ]]; then
        makefilecontent="a.out:\n\tcc -I x86_64 $cfiles -o a.out\n"
    else
        makefilecontent="a.out:\n\tcc -I x86 $cfiles -o a.out\n"
    fi
else
    makefilecontent="a.out:\n\tcc $cfiles -o a.out\n"
fi
makefilecontent+="\nclean:\n\trm -f *.o a.out\n"
printf "$makefilecontent" > Makefile