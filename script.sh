#!/bin/sh -e
#AVISO! NÃO ALTERE O SCRIPT, PODE OCORRER ERRO NA MINERAÇAO!
#CASO OCORRA ALGUM ERRO, ENTRE EM CONTATO O MAIS RAPIDO POSSIVEL.
clear
# DIREITOS RESERVADOS | GRUPO NIFERBITCOINS
# SKYPE LUMASTICO1945
#GRUPO SKYPE https://join.skype.com/cYHttmk2sdpA
 
bash=$(echo $BASH)
 
versao=1.0
 
corPadrao="\033[0m"
verde="\033[0;32m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
branco="\033[1;37m"
purpleClaro="\033[1;35m"
 
wallet=$1
 
if [ "$1" = ""  ]
then
echo "$branco ************************************************************************** \033[0m " 
echo "$branco ####### Minerador NiceHash - CPU CryptoNight  ####### \033[0m "  
echo "$branco ************************************************************************** \033[0m " 
echo ""          
sleep 1
echo "$amarelo Forma de USO: \033[0m"
echo "sudo sh $0 $branco ***SuaCarteira*** \033[0m  \n "
echo "$amarelo Exemplo:\033[0m"
echo "sudo sh $0 $branco 18ZD2Sjxm2YkEDR5wdVzqFVzj1noWL76Ly \033[0m   \n"
echo "$amarelo Ajuda? entre no grupo do Skype https://join.skype.com/zoQ7sHNSpooA \033[0m"
echo ""
exit 0
fi
 
echo "$vermelhoClaro *************************************************************************\033[0m " 
echo "$vermelhoClaro #############  Criador do script Ocitsamul  ######### \033[0m "
echo "$vermelhoClaro *************************************************************************\033[0m "
echo ""
sleep 1
echo "$amarelo # Carteira a ser Enviada os Bitcoins Minerados: $branco$wallet\033[0m   "
echo ""
sleep 1
 
echo "$purpleClaro ************************************************************** \033[0m   \n" 
echo "$purpleClaro ######## TERMOS E CONDIÇÕES ########## \033[0m   \n"
echo "$purpleClaro ************************************************************** \033[0m   \n"
echo "                                                                                                                      "
sleep 2
echo "$branco  **************************************************************************************************"
echo "                                                                                                                                         "
echo "$amarelo     # Duvida? grupo de Skype$branco https://join.skype.com/zoQ7sHNSpooA "
echo "$amarelo     # Grupo do Discord$branco https://discord.gg/AxQGhG5                            "
echo "$amarelo     # Nao venda esse script ou alugue!                                                             "
echo "                                                                                                                                         "
echo "$amarelo     # Sua carteira de BTC $branco$wallet                                                         "
echo "                                                                                                                                         "  
echo "$branco  **************************************************************************************************"
echo ""
 
sleep 10
 
echo "$verdeClaro *************************************************************    \033[0m "
echo "$verdeClaro ######### BAIXANDO RECURSOS! #########    \033[0m "
echo "$verdeClaro *************************************************************    \033[0m "
echo ""
sleep 1
sudo apt-get install libssl-dev libjansson-dev libcurl4-nss-dev
sudo apt-get install build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake g++
sudo apt-get install libcurl3 build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen -y > /dev/null
sudo yum -y groupinstall "Development Tools" > /dev/null
sudo yum install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake screen libcurl-devel python-devel rsync -y > /dev/null

git clone https://github.com/lumastico/minerador > /dev/null
cd minerador
chmod 777 *
sleep 1
 
echo "$amarelo ********************************************************************  \033[0m " 
echo "$amarelo ######### CONFIGURANDO O SCRIPT! #########   \033[0m "
echo "$amarelo ********************************************************************  \033[0m "
echo ""
sleep 1
./autogen.sh
./configure CFLAGS="-O3"
./build.sh
make
 
echo "$vermelhoClaro ******************************************************************\033[0m " 
echo "$vermelhoClaro ######### INICIANDO A MINERAÇÃO! ##########     \033[0m "
echo "$vermelhoClaro ******************************************************************     \033[0m "
echo ""
sleep 2

echo "$amarelo Obs: Assim que aparecer 'INICIANDO MINERAÇÃO', Aguarde 15 segundos e você ja pode fechar sua janela do terminal, que a mineração nao vai ser afetada... \033[0m"
sleep 1
echo "$branco Agora você ja pode acessa o WEBSITE http://www.nicehash.com/miner/$wallet para acompanhar sua mineração! \033[0m"
sleep 10
screen ./cpuminer -D -a cryptonight -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u $wallet -p x
