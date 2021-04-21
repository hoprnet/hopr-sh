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
                # For macOS
                if [ "$(uname -s)" == "Darwin" ]; then
                    read vrelease
                    if [ -f ~/.nvm/nvm.sh ]; then
                        echo 'sourcing nvm from ~/.nvm'
                        . ~/.nvm/nvm.sh
                    fi
                    if command -v nvm ; then
                        nvm i v14.16.1
                    else
                        echo "WARN: unable to configure nvm, installing with brew"
                        brew install node@14
                    fi
                    npm install --unsafe-perm=true -g @hoprnet/hoprd@$vrelease
                    hoprd --help
                # For Linux
                else
                    read vrelease
                    sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
                    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
                    sudo apt -y install gcc g++ make
                    if [ -f ~/.nvm/nvm.sh ]; then
                        echo 'sourcing nvm from ~/.nvm'
                        . ~/.nvm/nvm.sh
                    fi
                    if command -v nvm ; then
                        nvm i v14.16.1
                        npm install --unsafe-perm=true -g @hoprnet/hoprd@$vrelease
                    else
                        echo "WARN: unable to configure nvm, installing with apt"
                        sudo apt -y install nodejs
                        sudo npm install --unsafe-perm=true -g @hoprnet/hoprd@$vrelease
                    fi
                    hoprd --help
                fi
                exit ;;
            n)
                echo "Goodbye!"
                exit ;;
        esac
    esac
done
