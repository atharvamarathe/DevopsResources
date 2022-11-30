declare -A hm
declare -A headerFiles
generate_make_file() {
    rm -f Makefile
    echo "all: a.out" >> Makefile
    str3=""
    for key in ${!headerFiles[@]}
    do
        str3+="$key.o "
    done
    echo -e "a.out: $str3" >> Makefile
    echo -e "\tgcc -Wall $str3" >> Makefile
    for key in ${!headerFiles[@]}
    do
        if [ ${#hm[$key]} -eq 0 ];then
            str6="$key.o: $key.c "
            # str5=""
            IFS=' '
            read -ra temp4 <<< "${headerFiles[$key]}"
            for val in ${temp4[@]}
            do 
                str6+="$val "
            done
            echo -e "$str6" >> Makefile
            echo -e "\tgcc -Wall -c $key.c" >> Makefile
        fi
    done
    for key in ${!hm[@]}
    do
        str="$key.o: "
        str1="$key.c "
        IFS=' '
        read -ra temp <<< "${hm[$key]}"
        for val in ${temp[@]}
        do 
            str1+="$val "
        done
        str4=""
        IFS=' '
        read -ra temp1 <<< "${headerFiles[$key]}"
        for val in ${temp1[@]}
        do 
            str4+="$val "
        done
        str+=$str1
        str+=$str4
        # echo $str
        
        echo -n $str >> Makefile
        echo >> Makefile
        echo -e "\tgcc -Wall -c $str1" >> Makefile
    done
}

read_cscope_func() {
    arr1=$1
    str1=$(cscope -L3 ${arr1[0]})
    if [ ${#str1} -gt 0 ];then
        IFS=$'\n'
        read -rd '' -a y <<<"$str1"
        for val in "${y[@]}";
        do
            IFS=' '
            read -ra line1 <<< "$val"
            IFS='.'
            read -ra temp <<< "${line1[0]}"
            if [ ${#hm[$temp]} -eq 0 ];then
                hm[$temp]=""
            fi
        done
        for key in ${!hm[@]}
        do
            hm[$key]+=$2
            hm[$key]+=" "
        done
    fi
}

read_tags_line() {
    line=$1
    c=${line:0:1}
    if [ $c != "!" ]; then
        IFS=$'\t'
        read -ra arr <<< "$line"
        if [ `echo ${arr[1]} | grep -c ".c" ` -gt 0 ];then
            read_cscope_func ${arr[0]} ${arr[1]}
        fi
    fi
}

get_header_files() {
    for FILE in *; do 
    old=$IFS
    IFS='.'
    file1=$FILE
    ans=""
    read -ra temp <<< $file1
    IFS=$old
    if [ "${temp[1]}" = "c" ]
    then 
        while IFS= read -r line; do
            v1=`echo $line | grep -P '#include "[^"]*"' -o`
            old=$IFS
            IFS=$'\n'
            read -a headers <<< $v1
            for key in ${headers[@]}
            do
                old1=$IFS
                IFS='"'
                read -a header <<< $key
                IFS=$old1
                ans+="${header[1]} "
            done
        done < "${temp[0]}.c"
    headerFiles[${temp[0]}]=$ans
    fi
    IFS=$old
    done
}

ctags -R *
file="tags"
while read -r line; do
    read_tags_line "$line"
done <$file
get_header_files
generate_make_file
