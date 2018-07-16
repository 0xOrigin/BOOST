echo " 
                         ____   ____   ____   _____ _______ 
                        |  _ \ / __ \ / __ \ / ____|__   __|
                        | |_) | |  | | |  | | (___    | |   
                        |  _ <| |  | | |  | |\___ \   | |   
                        | |_) | |__| | |__| |____) |  | |   
                        |____/ \____/ \____/|_____/   |_|   
                                                                       
                                 By - @0xOrigin                               
"
echo "              "


if [ $1 ]
then
        if [ $1 = "-h" -o $1 = "--help" ]
        then
            echo "Usage: boost.sh [OPTIONS...] <list_name> <output_name>"            
            echo "       boost.sh [-h] Help, [-l] Domains list, [-c] Content spoofing."
            echo "              "
            echo "OPTIONS:"
            echo "  -h, --help              Show this help message and Exit."
            echo "  -l, --list              Domain list to Check the status of the site and put domains in HTML code."
            echo "  -c, --contentspoof      Check the domains that contain Content spoofing."
            exit
            elif [ $1 != "-h" -a $1 != "--help" -a $1 != "-l" -a $1 != "--list" -a $1 != "-c" -a $1 != "--contentspoof" ]
            then
            echo "[-] Try 'boost.sh --help' for more information."
            exit
        fi
else
echo "[-] Try 'boost.sh --help' for more information."
exit

fi

if [ $2 ]
then
    if [ -e $2  ]
    then
    ws=`cat $2`
    nm=`wc -l $2 | cut -d"." -f1 | cut -d" " -f1`
    else
    echo "[-] The File Not Found."
    exit
    fi

else
    echo "[+] Please Enter Websites List:"
    read lol
        if [ -e $lol  ]
        then
        ws=`cat $lol`
        nm=`wc -l $lol | cut -d"." -f1 | cut -d" " -f1`
        else
        echo "[-] The File Not Found."
        exit
        fi
fi


if [ $3 ]
then
op=$3
echo "[-] Will be saved in : Output/$op.$$.html "
else
echo "[+] Please Enter Output Name:"
read name
op=$name
echo "[-] Will be saved in : Output/$op.$$.html "
fi

if [ -d Output  ]
then
    cd Output
else
    mkdir Output
    cd Output
fi

echo "              "
echo "#----------------Starting BOOST TOOL at `date +"%Y-%m-%d %T %Z"`----------------#"
echo "              "
echo "[-] WebSites:"$nm
echo "      "
echo "<html>" > $op.$$.html
echo "<body>" >> $op.$$.html
echo "<h1 align="center">BOOST Click TOOL</h1>" >> $op.$$.html
echo "<ol>" >> $op.$$.html


if [ $1 = "-l" -o $1 = "--list" ]
then
    for load in $ws
    do
        if curl -s --head --request GET $load | grep "HTTP" > /dev/null
        then 
        echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> $op.$$.html
        echo $load >> $op.$$.txt
        echo "Processing....."
        fi
    done  

elif [ $1 = "-c" -o $1 = "--contentspoof" ]
then

    for load in $ws
    do
    if curl -s --head --request GET $load | grep "HTTP" > /dev/null 
        then
    if curl -s $load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one. | grep "changed" >> /dev/null
            then
            echo "<li><a href="http://$load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one." target="_blank">$load</a></li>" >> $op.$$.html
            echo "Processing....."
    fi
    fi
    done

fi
echo "</ol>" >> $op.$$.html
echo "</body>" >> $op.$$.html
echo "</html>" >> $op.$$.html

    sleep 1
    echo "          "
    echo "#------------------------Done at `date +"%Y-%m-%d %T %Z"`-----------------------#"
    xdg-open "$op.$$.html"

exit

