#/bin/bash


while getopts ":u:" input;do
        case "$input" in
                u) domain=${OPTARG}
                        ;;
                esac
        done
if [ -z "$domain" ]
        then
                echo "Please give a url \"-u https://website.com\"" | lolcat
                exit 1
fi

echo " "
echo "
 _ _ _                     
| | | | ___  _ _  ___  _ _ 
| | | || . \| | |/ ._>| '_>
|__/_/ |  _/|__/ \___.|_|  
       |_|                 
" | lolcat
echo "               by _frHaKtal_" | lolcat
echo " "


IFS='
'
var3=( $(curl -s $domain | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u | grep $domain | grep -wv "wp-content" | grep -wv "wp-includes") )
echo "--- searching for "$domain" ---" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols) | lolcat

for i in ${var3[@]}
do
	echo "searching in "$i | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
	var4+=$(curl -s $i | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u | grep $domain | grep "ver=")
done
echo " "
echo "... plugins list/themes with version ..." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols) | lolcat
echo $var4 | tr ' ' '\n' | sort -u

#echo ${var3[2]}
