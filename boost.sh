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
####################################################################### Variables ###################################################################################
first=$1
second=$2
third=$3
pro=1
date1=`  date   +%s`
#################################################################### Check First Parameter ##########################################################################
if [ $first ]
then
    if [ $first = "-h" -o $first = "--help" ]
    then
        echo "Usage: boost.sh [OPTIONS...] <list_name> <output_name>"            
        echo "       boost.sh [-h] Help, [-l] Domains list, [-c] Content spoofing."
        echo "              "
        echo "OPTIONS:"
        echo "  -h, --help              Show this help message and Exit."
        echo "  -l, --list              Domain list to Check the status of the site and put domains in HTML code."
        echo "  -c, --contentspoof      Check the domains that contain Content spoofing."
        exit
    elif [ $first != "-h" -a $first != "--help" -a $first != "-l" -a $first != "--list" -a $first != "-c" -a $first != "--contentspoof" ]
    then
        echo "[-] Try './boost.sh --help' for more information."
        exit
    fi
else
    echo "[+] Please Enter Method:"
    read first
    if [ $first != "-h" -a $first != "--help" -a $first != "-l" -a $first != "--list" -a $first != "-c" -a $first != "--contentspoof" ]
    then
        echo "[-] Try './boost.sh --help' for more information."
        exit
    fi
fi
############################################################# Check Second Parameter ###############################################################################
if [ $second ]
then
    if [ -e $second  ]
    then
        ws=`cat $second`
        nm=`wc -l $second | cut -d"." -f1 | cut -d" " -f1`
    else
        echo "[-] The File Not Found."
        exit
    fi
else
    echo "[+] Please Enter Websites List:"
    read second
    if [ -e $second  ]
    then
        ws=`cat $second`
        nm=`wc -l $second | cut -d"." -f1 | cut -d" " -f1`
    else
        echo "[-] The File Not Found."
        exit
    fi
fi
echo "              "
#################################################################### Check Third Parameter ########################################################################## 
if [ $third ]
then
    if [ $first = "-l" -o $first = "--list" ]
        then
            echo "[-] Will be saved in : `pwd`/Output/List/html/$third.$$.html "
            echo "[-] Will be saved in : `pwd`/Output/List/txt/$third.$$.txt "
    elif [ $first = "-c" -o $first = "--contentspoof" ]
        then
            echo "[-] Will be saved in : `pwd`/Output/Contentspoofing/html/$third.$$.html "
            echo "[-] Will be saved in : `pwd`/Output/Contentspoofing/txt/$third.$$.txt "      
        fi        
else
    echo "[+] Please Enter Output Name:"
    read third
            if [ $first = "-l" -o $first = "--list" ]
                then
                    echo "[-] Will be saved in : `pwd`/Output/List/html/$third.$$.html "
                    echo "[-] Will be saved in : `pwd`/Output/List/txt/$third.$$.txt "
            elif [ $first = "-c" -o $first = "--contentspoof" ]
                then
                    echo "[-] Will be saved in : `pwd`/Output/Contentspoofing/html/$third.$$.html "
                    echo "[-] Will be saved in : `pwd`/Output/Contentspoofing/txt/$third.$$.txt "
                fi   
fi
######################################################################### Check Files ################################################################################
if [ -d Output  ]
then    
    cd Output
                if [ ! -d Contentspoofing ]
                then
                    mkdir Contentspoofing && cd Contentspoofing && mkdir html && mkdir txt && cd ..
                else
                    cd Contentspoofing
                            if [ ! -d html ]
                            then
                                mkdir html
                            fi 
                            if [ ! -d txt ]
                            then
                                mkdir txt
                            fi 
                            cd ..
                fi
                if [ ! -d List ]
                then
                    mkdir List && cd List && mkdir html && mkdir txt && cd ..
                    else
                        cd List
                            if [ ! -d html ]
                            then
                                mkdir html
                            fi 
                            if [ ! -d txt ]
                            then
                                mkdir txt
                            fi 
                            cd ..
                fi
else
    mkdir Output
    cd Output
    mkdir Contentspoofing && cd Contentspoofing && mkdir html && mkdir txt
    cd ..
    mkdir List && cd List && mkdir html && mkdir txt
    cd ..
fi
####################################################################### Main Function ################################################################################
echo "              "
if [ $first = "-l" -o $first = "--list" ]
then
    echo "#--------------Starting BOOST List TOOL at `date +"%Y-%m-%d %T %Z"`-------------#"
    echo "              "
    echo "[-] WebSites:"$nm
    echo "      "
    echo "<html>" > List/html/$third.$$.html
    echo "<body>" >> List/html/$third.$$.html
    echo "<h1 align="center">BOOST List TOOL</h1>" >> List/html/$third.$$.html
    echo "<ol>" >> List/html/$third.$$.html
while true 
do
    while [ $pro -le $nm ]
    do
        for load in $ws
        do
          if echo "Y" | GET -s -d -t 3 $load | grep "certificate verify failed" > /dev/null
          then
              echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.$$.html
              echo $load >> List/txt/$third.$$.txt
          elif echo "Y" | GET -s -d -t 3 $load | grep "hostname verification failed" > /dev/null
          then
              echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.$$.html
              echo $load >> List/txt/$third.$$.txt
          fi

            if ! echo "Y" | GET -s -d -t 5 $load | grep "500" > /dev/null
            then 

                echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.$$.html
                echo $load >> List/txt/$third.$$.txt
                echo -ne "                                                                    $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
                echo "$pro- Processing....."  
            fi
            let pro=pro+1 
        done       
    done
echo "                  "
echo "[-] It takes $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S) seconds to Complete this Task." 
break
done  
 
        echo "</ol>" >> List/html/$third.$$.html
        echo "</body>" >> List/html/$third.$$.html
        echo "</html>" >> List/html/$third.$$.html

        sleep 1
        echo "          "

        echo "#------------------------Done at `date +"%Y-%m-%d %T %Z"`-----------------------#"
        echo "      "
                    echo "[-] Saved in : `pwd`/Output/List/html/$third.$$.html "
                    echo "[-] Saved in : `pwd`/Output/List/txt/$third.$$.txt "     
        echo "          "       
        xdg-open "List/html/$third.$$.html"

elif [ $first = "-c" -o $first = "--contentspoof" ]
then
    echo "#--------Starting BOOST Content spoofing TOOL at `date +"%Y-%m-%d %T %Z"`-------#"
    echo "              "
    echo "[-] WebSites:"$nm
    echo "      "
    echo "<html>" > Contentspoofing/html/$third.$$.html
    echo "<body>" >> Contentspoofing/html/$third.$$.html
    echo "<h1 align="center">BOOST Content spoofing TOOL</h1>" >> Contentspoofing/html/$third.$$.html
    echo "<ol>" >> Contentspoofing/html/$third.$$.html
while true 
do
while [ $pro -le $nm ]
do
  for load in $ws
  do
            if echo "Y" | GET -s -d -t 2 $load | grep "certificate verify failed" > /dev/null
              then
                  echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> Contentspoofing/html/$third.$$.html
                  echo $load >> Contentspoofing/txt/$third.$$.txt
            elif echo "Y" | GET -s -d -t 3 $load | grep "hostname verification failed" > /dev/null
                then
                    echo "<li><a href="http://$load" target="_blank">$load</a></li>" >> Contentspoofing/html/$third.$$.html
                    echo $load >> Contentspoofing/txt/$third.$$.txt
              fi
                if ! echo "Y" | GET -s -d -t 5 $load | grep "500" > /dev/null
                then 
        if echo "Y" | GET $load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one. | grep "changed" >> /dev/null
                then
                echo "<li><a href="http://$load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one." target="_blank">$load</a></li>" >> Contentspoofing/html/$third.$$.html
                echo $load >> Contentspoofing/txt/$third.$$.txt
                echo -ne "                                                                    $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
                echo "$pro- Processing....."
        fi
        fi
        let pro=pro+1
done
done
        echo "                  "
        echo "[-] It takes $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S) seconds to Complete this Task." 
        break
done
        echo "</ol>" >> Contentspoofing/html/$third.$$.html
        echo "</body>" >> Contentspoofing/html/$third.$$.html
        echo "</html>" >> Contentspoofing/html/$third.$$.html    
        sleep 1
        echo "          "
        echo "#------------------------Done at `date +"%Y-%m-%d %T %Z"`-----------------------#"
        echo "  "
                    echo "[-] Saved in : `pwd`/Output/Contentspoofing/html/$third.$$.html "
                    echo "[-] Saved in : `pwd`/Output/Contentspoofing/txt/$third.$$.txt " 
        echo "          "
        xdg-open "Contentspoofing/html/$third.$$.html"
fi    
######################################################################### Main Function End ##########################################################################
exit
