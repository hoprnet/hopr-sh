#!/bin/bash

RED='\033[0;91m'
CYAN='\033[0;96m'
YELLOW='\033[1;93m'
NC='\033[0m' # No Color
echo -e "
${YELLOW}██╗  ██╗ ██████╗ ██████╗ ██████╗ \n██║  ██║██╔═══██╗██╔══██╗██╔══██╗\n███████║██║   ██║██████╔╝██████╔╝\n██╔══██║██║   ██║██╔═══╝ ██╔══██╗\n██║  ██║╚██████╔╝██║     ██║  ██║\n╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝\n${NC}"
echo -e ${CYAN}By installing this node, you agree to our Privacy Policy found at https://hoprnet.org/privacy-policy${NC}
while [ "$response" != "n" ]
do
    read -p "Do you agree to our Privacy Policy? [y/n]:" response
    case $response in
        y) echo Terrific!
        echo -e ${RED}Warning! Running this script repeatedly will cause you to have a new node address each time.${NC}
        while [ "$response" != "n" ]
        do
            read -p "Would you like to run this script? [y/n]:" response
            case $response in
                y) echo What release are you installing? Format: X.XX.X
                   read vrelease
                   [ ! -d "root/db-old$((`ls root | wc -w`))" ] && mv -f root/db root/db-old$((`ls root | wc -w`))
                   sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
                   curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
                   sudo apt -y  install gcc g++ make
                   sudo apt -y install nodejs
                   sudo npm install --unsafe-perm=true -g @hoprnet/hoprd@$vrelease
                   DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin 2> titlis[$vrelease].log.txt
                            ;;
                n)
                    echo "Goodbye!"
                    exit ;;
            esac
        done
                    ;;
        n)
            echo "Goodbye!"
            exit ;;
    esac
done
