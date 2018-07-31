####################################################################### Variables ###################################################################################
first=$1
second=$2
third=$3
pro=1
date1=`  date   +%s`
## Colors ##
lightred="\e[91m"
lightcyan="\e[96m"
lightgreen="\e[92m"
lightblue="\e[94m"
lightyellow="\e[93m"
lightmagenta="\e[95m"
lightblue="\e[94m"
blue="\e[34m"
endcolor="\e[0m"
backblue="\e[44m"
bold="\e[1m"
color="\e[38;5;208m"
color2="\e[38;5;228m"
######################################################################## Beginning ###################################################################################
echo -e "$lightred 
                         ____   ____   ____   _____ _______ 
                        |  _ \ / __ \ / __ \ / ____|__   __|
                        | |_) | |  | | |  | | (___    | |   
                        |  _ <| |  | | |  | |\___ \   | |   
                        | |_) | |__| | |__| |____) |  | |   
                        |____/ \____/ \____/|_____/   |_|   
                                                                       
                                $endcolor By - @0xOrigin                               
"
echo -e "              "
#################################################################### Check First Parameter ##########################################################################
if [ $first ]
then
    if [ $first = "-h" -o $first = "--help" ]
    then
        echo -e "Usage: boost.sh [OPTIONS...] <list_name> <output_name>"            
        echo -e "       boost.sh [-h] Help, [-l] Domains list, [-c] Content spoofing."
        echo -e "              "
        echo -e "OPTIONS:"
        echo -e "  -h, --help              Show this help message and Exit."
        echo -e "  -l, --list              Domain list to Check the status of the site and put domains in HTML code."
        echo -e "  -c, --contentspoof      Check the domains that contain Content spoofing."
        exit
    elif [ $first != "-h" -a $first != "--help" -a $first != "-l" -a $first != "--list" -a $first != "-c" -a $first != "--contentspoof" ]
    then
        echo -e "$lightmagenta[-]$lightgreen The Method Not Vaild $lightmagenta,$lightgreen Try$lightcyan '$lightred./boost.sh --help$lightcyan'$lightgreen for more information$lightmagenta.$endcolor"
        exit
    fi
else
    echo -e "$lightmagenta[+]$lightgreen Please Enter Method$lightmagenta:$endcolor  \c"
    read first
    while [ -z $first ]
    do
    echo -e echo -e "$lightmagenta[-]$lightgreen The Method Not Vaild $lightmagenta,$lightgreen Try$lightcyan '$lightred./boost.sh --help$lightcyan'$lightgreen for more information$lightmagenta.$endcolor"
    exit
    done
    if [ $first != "-h" -a $first != "--help" -a $first != "-l" -a $first != "--list" -a $first != "-c" -a $first != "--contentspoof" ]
    then
        echo -e echo -e "$lightmagenta[-]$lightgreen The Method Not Vaild $lightmagenta,$lightgreen Try$lightcyan '$lightred./boost.sh --help$lightcyan'$lightgreen for more information$lightmagenta.$endcolor"
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
        echo -e "$lightmagenta[-]$lightgreen The File Not Found$lightmagenta.$endcolor"
        exit
    fi
else
    echo -e "$lightmagenta[+]$lightgreen Please Enter Websites List$lightmagenta:$endcolor  \c"
    read second
    echo -e "              "
    while [ -z $second ]
    do
    echo -e "$lightmagenta[-]$lightgreen The File Not Found$lightmagenta.$endcolor"
    exit
    done
    if [ -e $second  ]
    then
        ws=`cat $second`
        nm=`wc -l $second | cut -d"." -f1 | cut -d" " -f1`
    else
        echo -e "$lightmagenta[-]$lightgreen The File Not Found$lightmagenta.$endcolor"
        exit
    fi
fi
#################################################################### Check Third Parameter ########################################################################## 
if [ $third ]
then
    if [ $first = "-l" -o $first = "--list" ]
        then
            echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/List/html/$third.html$endcolor"
            echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/List/txt/$third.txt$endcolor"
    elif [ $first = "-c" -o $first = "--contentspoof" ]
        then
            echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/Contentspoofing/html/$third.html$endcolor"
            echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/Contentspoofing/txt/$third.txt$endcolor"      
        fi    
else
    echo -e "$lightmagenta[+]$lightgreen Please Enter Output Name$lightmagenta:$endcolor  \c"
    read third
    echo -e "              "
    while [ -z $third ]
    do
    echo -e "$lightmagenta[-]$lightgreen The Output Name Not Valid$lightmagenta.$endcolor"
    exit
    done
    while [ $third = " " ]
    do
    echo -e "$lightmagenta[-]$lightgreen The Output Name Not Valid$lightmagenta.$endcolor"
    exit
    done
            if [ $first = "-l" -o $first = "--list" ]
                then
                    echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/List/html/$third.html$endcolor"
                    echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/List/txt/$third.txt$endcolor"
            elif [ $first = "-c" -o $first = "--contentspoof" ]
                then
                    echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/Contentspoofing/html/$third.html$endcolor"
                    echo -e "$lightmagenta[-]$lightgreen Will be saved in $lightmagenta: $lightyellow`pwd`/Output/Contentspoofing/txt/$third.txt$endcolor"
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
echo -e "              "
if [ $first = "-l" -o $first = "--list" ]
then
            echo -e "$bold$blue#$endcolor--------------"$color"Starting BOOST List TOOL at $lightcyan`date +"%Y-%m-%d %T$color %Z"`$endcolor-------------$bold$blue#$endcolor"
            echo -e "              "
            echo -e "$lightmagenta[-]$lightgreen WebSites$lightmagenta:$endcolor"$nm
            echo -e "      "
            echo -e "<html>" > List/html/$third.html
            echo -e "<body>" >> List/html/$third.html
            echo -e "<h1 align="center">BOOST List TOOL</h1>" >> List/html/$third.html
            echo -e "<ol>" >> List/html/$third.html
            : > List/txt/$third.txt
        while true 
        do
            while [ $pro -le $nm ]
            do
                for load in $ws
                do
                  ex=`expr $nm - $pro`    
                  if echo -e "Y" | GET -s -d -t 3 $load | grep "certificate verify failed" > /dev/null
                  then
                      echo -e "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.html
                      echo -e $load >> List/txt/$third.txt
                  elif echo -e "Y" | GET -s -d -t 3 $load | grep "hostname verification failed" > /dev/null
                  then
                      echo -e "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.html
                      echo -e $load >> List/txt/$third.txt
                  fi

                    if ! echo -e "Y" | GET -s -d -t 5 $load | grep "500" > /dev/null
                    then 
                        echo -e "<li><a href="http://$load" target="_blank">$load</a></li>" >> List/html/$third.html
                        echo -e $load >> List/txt/$third.txt
                    fi
        echo -ne "\r$lightcyan$pro$lightmagenta-$lightgreen Processing$lightmagenta.....$lightgreen Remaining $endcolor$ex                                    $lightcyan$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)$endcolor "\

                    let pro=pro+1 
                done  
            done
        break
        done
                echo -e "  \n"
                echo -e "</ol>" >> List/html/$third.html
                echo -e "</body>" >> List/html/$third.html
                echo -e "</html>" >> List/html/$third.html
                echo -e "$lightmagenta[-]$lightgreen It takes $lightcyan$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)$lightgreen seconds to Complete this Task$lightmagenta.$endcolor"
                echo -e "          "
                echo -e "$bold$blue#$endcolor------------------------"$color"Done at $lightcyan`date +"%Y-%m-%d %T$color %Z"`$endcolor-----------------------$bold$blue#$endcolor"
                sleep 1
                echo -e "      "
                            echo -e "$lightmagenta[-]$lightgreen Saved in $lightmagenta: $lightyellow`pwd`/List/html/$third.html$endcolor"
                            echo -e "$lightmagenta[-]$lightgreen Saved in $lightmagenta: $lightyellow`pwd`/List/txt/$third.txt$endcolor"     
                echo -e "          "       
                echo -e "$lightmagenta[-]$lightgreen Opening$lightmagenta.... $lightyellow`pwd`/List/html/$third.html$endcolor"
                xdg-open "List/html/$third.html" > /dev/null

elif [ $first = "-c" -o $first = "--contentspoof" ]
then
            echo -e "$bold$blue#$endcolor--------"$color"Starting BOOST Content spoofing TOOL at $lightcyan`date +"%Y-%m-%d %T$color %Z"`$endcolor-------$bold$blue#$endcolor"
            echo -e "              "
            echo -e "$lightmagenta[-]$lightgreen WebSites$lightmagenta:$endcolor"$nm
            echo -e "      "
            echo -e "<html>" > Contentspoofing/html/$third.html
            echo -e "<body>" >> Contentspoofing/html/$third.html
            echo -e "<h1 align="center">BOOST Content spoofing TOOL</h1>" >> Contentspoofing/html/$third.html
            echo -e "<ol>" >> Contentspoofing/html/$third.html
            : > Contentspoofing/txt/$third.txt
        while true 
        do
        while [ $pro -le $nm ]
        do
          for load in $ws
          do
                    ex=`expr $nm - $pro`
                    if echo -e "Y" | GET -s -d -t 2 $load | grep "certificate verify failed" > /dev/null
                      then
                          echo -e "<li><a href="http://$load" target="_blank">$load</a></li>" >> Contentspoofing/html/$third.html
                          echo -e $load >> Contentspoofing/txt/$third.txt
                    elif echo -e "Y" | GET -s -d -t 3 $load | grep "hostname verification failed" > /dev/null
                        then
                            echo -e "<li><a href="http://$load" target="_blank">$load</a></li>" >> Contentspoofing/html/$third.html
                            echo -e $load >> Contentspoofing/txt/$third.txt
                      fi
                        if ! echo -e "Y" | GET -s -d -t 5 $load | grep "500" > /dev/null
                        then 
                if echo -e "Y" | GET $load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one. | grep "changed" >> /dev/null
                        then
                        echo -e "<li><a href="http://$load/It%20has%20been%20changed%20by%20a%20new%20one%20https://www.attacker.com%20so%20go%20to%20the%20new%20one%20since%20this%20one." target="_blank">$load</a></li>" >> Contentspoofing/html/$third.html
                        echo -e $load >> Contentspoofing/txt/$third.txt
                    fi
                    fi
                    echo -ne "\r$lightcyan$pro$lightmagenta-$lightgreen Processing$lightmagenta.....$lightgreen Remaining $endcolor$ex                                    $lightcyan$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)$endcolor "\
                   
 let pro=pro+1 
        done
        done
        break
        done
                echo -e "  \n"
                echo -e "</ol>" >> Contentspoofing/html/$third.html
                echo -e "</body>" >> Contentspoofing/html/$third.html
                echo -e "</html>" >> Contentspoofing/html/$third.html   
                echo -e "$lightmagenta[-]$lightgreen It takes $lightcyan$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)$lightgreen seconds to Complete this Task$lightmagenta.$endcolor" 
                echo -e "          "
                echo -e "$bold$blue#$endcolor------------------------"$color"Done at $lightcyan`date +"%Y-%m-%d %T$color %Z"`$endcolor-----------------------$bold$blue#$endcolor"
                sleep 1
                echo -e "  "
                            echo -e "$lightmagenta[-]$lightgreen Saved in $lightmagenta: $lightyellow`pwd`/Contentspoofing/html/$third.html$endcolor"
                            echo -e "$lightmagenta[-]$lightgreen Saved in $lightmagenta: $lightyellow`pwd`/Contentspoofing/txt/$third.txt$endcolor" 
                echo -e "          "
                
                echo -e "$lightmagenta[-]$lightgreen Opening$lightmagenta.... $lightyellow`pwd`/Contentspoofing/html/$third.html$endcolor"
                xdg-open "Contentspoofing/html/$third.html" > /dev/null
fi    
######################################################################### Main Function End ##########################################################################
exit
