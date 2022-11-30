rm -f Makefile
dependancies=$(ls *.c)
read -ra temp <<< "$dependancies"
str1=""
for file in ${temp[@]}
do
    str1+="$file "
done
echo -e "a.out:" >> Makefile
echo -e "\tcc -I $(uname -m) $str1 -o a.out" >> Makefile
echo -e "clean:\n\trm -f *.o a.out" >> Makefile