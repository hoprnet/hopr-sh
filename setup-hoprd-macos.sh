#!/bin/bash

RED='\033[0;91m'
CYAN='\033[0;96m'
YELLOW='\033[1;93m'
NC='\033[0m' # No Color

# print HOPR logo
echo -e "
${YELLOW}██╗  ██╗ ██████╗ ██████╗ ██████╗ \n██║  ██║██╔═══██╗██╔══██╗██╔══██╗\n███████║██║   ██║██████╔╝██████╔╝\n██╔══██║██║   ██║██╔═══╝ ██╔══██╗\n██║  ██║╚██████╔╝██║     ██║  ██║\n╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝\n${NC}"

# print policy warning
echo -e ${CYAN}By installing this node, you agree to our Privacy Policy found at https://hoprnet.org/privacy-policy${NC}

while [ "$response" != "n" ]
do
    read -p "Do you agree to our Privacy Policy? [y/n]:" response
    case $response in
        y) echo Terrific!
        echo -e ${RED}Warning! Running this script repeatedly will cause you to have a new node address each time.${NC}

        read -p "Would you like to run this script? [y/n]:" response
        case $response in
            y) echo What release are you installing? Format: X.XX.X \(https://github.com/hoprnet/hoprnet/releases\)
                read vrelease
                brew install node@16
                mkdir hopr-$vrelease && cd hopr-$vrelease
                npm install @hoprnet/hoprd@$vrelease
                NODE_VERSION=$(npx hoprd --version)
                echo "hoprd version: ${NODE_VERSION}"
                exit ;;
            n)
                echo "Goodbye!"
                exit ;;
        esac
    esac
done
