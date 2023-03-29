#!/bin/bash

function display {
    toilet --${WATERMARK_COLOR} -f mono12 ${WATERMARK}
}
function pmmp {
       ./bin/php7/bin/php ./${PHARFILE} --no-wizard --disable-ansi
}

function java {
       curl -s -O https://panel.foxynodes.com/lib/java.tar.gz
       tar -xzf java.tar.gz
       sleep 5
       rm -rf java.tar.gz
       mkdir .jabba/jdk
}
function java19 {
       cd .jabba/jdk 
       curl -s -O https://download.java.net/java/GA/jdk19.0.1/afdd2e245b014143b62ccb916125e3ce/10/GPL/openjdk-19.0.1_linux-x64_bin.tar.gz
       tar -xzf openjdk-19.0.1_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-19.0.1_linux-x64_bin.tar.gz
       mv jdk-19.0.1 jdk
       cd
}
function java18 {
       cd .jabba/jdk
       curl -s -O https://download.java.net/java/GA/jdk18.0.2/f6ad4b4450fd4d298113270ec84f30ee/9/GPL/openjdk-18.0.2_linux-x64_bin.tar.gz
       tar -xzf openjdk-18.0.2_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-18.0.2_linux-x64_bin.tar.gz
       mv jdk-18.0.2 jdk
       cd
}
function java17 {
       cd .jabba/jdk
       curl -s -O https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
       tar -xzf openjdk-17.0.2_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-17.0.2_linux-x64_bin.tar.gz
       mv jdk-17.0.2 jdk
       cd
}
function java16 {
       cd .jabba/jdk
       curl -s -O https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz
       tar -xzf openjdk-14.0.2_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-14.0.2_linux-x64_bin.tar.gz
       mv jdk-14.0.2 jdk
       cd
}
function java14 {
       cd .jabba/jdk
       curl -s -O https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz
       tar -xzf openjdk-14.0.2_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-14.0.2_linux-x64_bin.tar.gz
       mv jdk-14.0.2 jdk
       cd
}
function java11 {
       cd .jabba/jdk
       curl -s -O https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
       tar -xzf openjdk-11.0.2_linux-x64_bin.tar.gz
       sleep 5
       rm -rf openjdk-11.0.2_linux-x64_bin.tar.gz
       mv jdk-11.0.2 jdk
       cd
}
function php7 {
       echo "Configuring extension files."
       curl -s -O https://panel.foxynodes.com/lib/pmmp.tar.gz
       tar -xvzf pmmp.tar.gz
       sleep 5
       rm pmmp.tar.gz
}
function php8 {
       echo "Downloading extensions."
       curl -s -O https://github.com/pmmp/PHP-Binaries/releases/latest/download/PHP-Linux-x86_64-PM5.tar.gz
       tar -xvzf PHP-Linux-x86_64-PM5.tar.gz
       sleep 5
       rm PHP-8.0-Linux-x86_64.tar.gz 
}
function nvm_nodejs {
       if [ -e ".nvmrc" ]
then 
    echo "HI" 2> /dev/null > /dev/null
else
    touch .nvmrc
fi

if [ -d ".nvm" ]
then 
    echo "HI" 2> /dev/null > /dev/null
else
    mkdir -p .nvm
fi

if [ -d "temp-folder" ]
then 
    echo "HI" 2> /dev/null > /dev/null
else
    mkdir -p temp-folder
fi

if [ -z "$NODEJS_VERSION" ] ; then
    echo "==============================="
    echo "NodeJS version can be nodejs14 , nodejs16 , custom"
    read -p "NodeJS: " NODEJS_VERSION_SELECT </dev/tty
    echo "==============================="
case $NODEJS_VERSION_SELECT in
nodejs14)
  echo "==============================="
  echo "NodeJS 14"
  NODEJS_VERSION="14"
  echo "==============================="  
;;
nodejs16)
  echo "==============================="
  echo "NodeJS 16"
  NODEJS_VERSION="16"
  echo "==============================="
;;
custom)
  echo "==============================="
  echo "Custom NodeJS version"
  read -p "NodeJS version: " NODEJS_VERSION </dev/tty
  echo "Using NodeJS $NODEJS_VERSION"
  echo "==============================="
;;
*)
  echo "hi" 2> /dev/null > /dev/null
;;
esac
fi

curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | NVM_DIR=/home/container/.nvm bash 2> /dev/null > /dev/null
NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules 
export NVM_DIR="/home/container/.nvm" 2> /dev/null > /dev/null
export TMPDIR="$HOME/temp-folder"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm 2> /dev/null > /dev/null
     echo "==============================="
     echo "Installing NodeJS ${NODEJS_VERSION}" 
     nvm install "${NODEJS_VERSION}"
     nvm alias default "${NODEJS_VERSION}"
     echo "==============================="
     sleep 2s
     echo "==============================="
     echo "Upgrading NPM to latest version"
     npm install -g npm@latest --log-level warn
     echo "==============================="
     sleep 2s
     echo "==============================="
     echo "Installing yarn"
     npm install -g yarn --log-level warn
     echo "==============================="
     clear

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
function py_env {
       if [ -d "temp-folder" ]
then 
    echo "HI" 2> /dev/null > /dev/null
else
    mkdir -p temp-folder
fi

if [ -z "$PYTHON_VERSION" ] ; then
    echo "==============================="
    echo "Python version can be 3.9.1 , custom"
    read -p "Python: " PYTHON_VERSION_SELECT </dev/tty
    echo "==============================="
case $PYTHON_VERSION_SELECT in
3.9.1)
  echo "==============================="
  echo "Python 3.9.1"
  PYTHON_VERSION="3.9.1"
  echo "==============================="
;;
custom)
  echo "==============================="
  echo "Custom python version"
  read -p "Python version: " PYTHON_VERSION </dev/tty
  echo "Using python $PYTHON_VERSION"
  echo "==============================="
;;
*)
  echo "hi" 2> /dev/null > /dev/null
;;
esac
fi

git clone https://github.com/pyenv/pyenv.git ~/.pyenv 2> /dev/null > /dev/null
export PYENV_ROOT="$HOME/.pyenv"
PATH="/home/container/.pyenv/bin:$PATH"
eval "$(pyenv init -)" 2> /dev/null > /dev/null
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv 2> /dev/null > /dev/null
eval "$(pyenv virtualenv-init -)" 2> /dev/null > /dev/null
export TMPDIR="$HOME/temp-folder"
echo "Using Python ${PYTHON_VERSION}"
pyenv install "${PYTHON_VERSION}" -s
pyenv global "${PYTHON_VERSION}"
rm -rf temp-folder/python-build*
clear

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)"
}
function go_env {
       if [ -d "temp-folder" ]
then 
    echo "HI" 2> /dev/null > /dev/null
else
    mkdir -p temp-folder
fi
  
if [ -z "$GOLANG_VERSION" ] ; then
    echo "==============================="
    echo "Golang version can be 1.16.5 , custom"
    read -p "Golang: " GOLANG_VERSION_SELECT </dev/tty
    echo "==============================="
case $GOLANG_VERSION_SELECT in
1.16.5)
  echo "==============================="
  echo "Golang 1.16.5"
  GOLANG_VERSION="1.16.5"
  echo "==============================="  
;;
custom)
  echo "==============================="
  echo "Custom Golang version"
  read -p "Golang version: " GOLANG_VERSION </dev/tty
  echo "Using Golang $GOLANG_VERSION"
  echo "==============================="
;;
*)
  echo "hi" 2> /dev/null > /dev/null
;;
esac
fi

git clone https://github.com/syndbg/goenv.git ~/.goenv 2> /dev/null > /dev/null
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
eval "$(goenv init -)" 
export GOPATH="$HOME/go" >> ~/.bash_profile
export TMPDIR="$HOME/temp-folder"

echo "Using Golang ${GOLANG_VERSION}"
goenv install "${GOLANG_VERSION}" -s
goenv global "${GOLANG_VERSION}"
rm -rf temp-folder/go-build*
clear
}
function mongodb_enviroment {
export PATH=$PATH:/home/container/mongodb/bin/

if exists mongod --version >/dev/null; then
    echo "Skipping mongodb install"
else
    wget -q https://fastdl.mongodb.org/linux/mongodb-linux-aarch64-amazon2-6.0.4.tgz
    tar xvf mongodb-linux-aarch64-amazon2-6.0.4.tgz
    mv mongodb-linux-aarch64-amazon2-6.0.4 mongodb
    rm -rf mongodb-linux-aarch64-amazon2-6.0.4.tgz
    mkdir -p mongodb/data && mkdir -p mongodb/logs
fi
}
function mariadb_enviroment {
export PATH=$PATH:/home/container/mariadb/bin/
export PATH=$PATH:/home/container/mariadb/scripts/

if exists mysql --version >/dev/null; then
    echo "Skipping mariadb install"
else
    mkdir -p mariadb run/mysqld log/mysql mysql
	  curl -sLo mariadb.tar.gz https://archive.mariadb.org//mariadb-10.3.32/bintar-linux-systemd-x86_64/mariadb-10.3.32-linux-systemd-x86_64.tar.gz
    tar -zxvpf mariadb.tar.gz --directory mariadb --strip-component=1
    rm -rf mariadb.tar.gz
    curl -s https://panel.foxynodes.com/lib/mariadb.my.cnf -o .my.cnf
    sed -i "s|^bind-address.*|bind-address=0.0.0.0|g" .my.cnf
    sed -i "s|^port.*|port = "$SERVER_PORT"|g" .my.cnf
    mysql_install_db --defaults-file=/home/container/.my.cnf
fi
}
function redis_enviroment {
export PATH=$PATH:$HOME/redis

if exists redis-server >/dev/null; then
    echo "Skipping redis install"
else
    curl -s https://packages.redis.io/redis-stack/redis-stack-server-6.2.6-v1.focal.x86_64.tar.gz -o redis.zip
    unzip redis.zip
    rm -rf redis.zip
    chmod +x redis/*
    curl -s https://foxynodes.com/lib/redis-6.conf -o redis.conf
    sed -i "s|^port.*|port "$SERVER_PORT"|g" redis.conf
fi
}

if [ ! -f plugins ];
     then
     mkdir plugins
fi
function launchJavaServer {
 .jabba/jdk/jdk/bin/java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar ${JARFILE}

}
function teamspeak {
       clear
       display
       echo "Starting the server."
       bash ./update.sh
}
function lavalink {
       clear
       display
       echo "Starting the server."
       .jabba/jdk/jdk/bin/java -jar Lavalink.jar
}
function proxy {
.jabba/jdk/jdk/bin/java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar ${JARFILE}
}
FILE=eula.txt
if [ -e "update.sh" ];
then 
clear
display
teamspeak
sleep 5
exit
fi

function optimizeJavaServer {
  echo "view-distance=6" >> server.properties
  
if [ -e "Lavalink.jar" ];
then 
clear
display
lavalink
sleep 5
exit
fi
} 
if [ -e "server.phar" ];
then 
clear
display
echo "Starting the server."
pmmp
sleep 5
exit
fi
if [ -e "bedrock_server" ];
then 
clear
display
echo "Starting the server."
LD_LIBRARY_PATH=. ./bedrock_server
sleep 5
exit
fi
 if [ "$SUSPEND" == "true" ];
      then
      clear
      echo "$SUSPEND_REASON"
      exit
fi

if [ "$HIBERNATE" == "true" ];
       then
       cd plugins 
       rm -rf Hibernate
       curl -s -o Hibernate.jar https://panel.foxynodes.com/lib/hiber.jar
       cd
fi

if [ "$WATERMARK_COLOR" == null ];
then
clear
display
echo "Egg is not updated. If admin please download latest afernact."
exit
fi

       
if [ -e "server.jar" ];
then
clear
display
echo "Starting the server."
launchJavaServer
sleep 5
exit
fi
clear
display
echo "
Which game server you want?
1) Minecraft  
2) Minecraft Bedrock
3) Minecraft Proxy
4) Bots       
5) Voice      
6) Grand Theft Auto
7) Database

Note: "Grand Theft Auto" And "Database" Is Still Being Developed Please Wait Untill Its Developed Its A Request!!
Note: "Bots" Is Being Tested Please Wait Untill Its Fully Developed Its A Request!!
"
read game

case $game in
      1) 
        sleep 1
        clear
        display
        echo "
        Which game server software you want?
        1) Paper (1.8.8 to 1.19.3)    
        2) Vanilla (1.8.8 to 1.19.3)
        3) Forge (1.8.8 to 1.19.3)    
        4) Spigot (1.8.8 to 1.19.3)
        5) Purpur (1.8.8 to 1.19.3)   
        "
        read mcsoft
        ;;
       2) 
         sleep 1
         clear
         display
         echo "
         Which game server software you want?
         1) Pocketmine-MP (Api 3 to Api 4)  
         2) Nukkitx (1.14 and 1.16)
         3) Bedrock                         
         "
         read bdsoft
         ;;
       3)
         sleep 1
         clear
         display
         echo "
         Which proxy you want to use?
         1) Bungeecord     
         2) Velocity
         3) Waterfall      
         4) Flamecord
         "
         read proxy
         ;;
       4)
         sleep 1
         clear
         display
         echo "
         Which bot you want to use?
         1) NodeJS
         2) Python
         "
         read bot
         ;;
       5)
         sleep 1
         clear
         display
         echo "
         Which voice server you want to use?
         1) Lavalink       
         2) Teamspeak
         3) Teaspeak       
         "
         read voice
         ;;
       6)
         sleep 1
         clear
         display
         echo "Still Being Developed Please Wait." 
         echo "Contact Admins"
         read gta
         ;;
       7)
         sleep 1
         clear
         display
         echo "
         Which database server you want to use?
         1) MongoDB
         2) MariaDB
         3) Redis
         "
         read database
         ;;
       *) 
         echo "Invalid Option, Exiting..."
         exit
         ;;
         esac

case $mcsoft in
       1)
         sleep 1
         clear
         display
         echo "
         Which version you want to use?
         1.19.3 1.18.2 1.17.1 1.16.5 1.15.2 1.14.4 1.13.2 1.12.2 1.11.2 1.10.2 1.9.4 1.8.8
         "
         read paper
         ;;
       2)
         sleep 1
         clear
         display
         echo "
         Which version you want to use?
         1.19.3 1.18.2 1.17.1 1.16.5 1.15.2 1.14.4 1.13.2 1.12.2 1.11.2 1.10.2 1.9.4 1.8.8
         "
         read vanilla
         ;;
       3)
         sleep 1
         clear
         display
         echo "
         Forge is disabled due to dependencies issues it will come soon 
         "
         ;;
       4)
         sleep 1
         clear
         display
         echo "
         Which version you want to use?
         1.19.3 1.18.2 1.17.1 1.16.5 1.15.2 1.14.4 1.13.2 1.12.2 1.11.2 1.10.2 1.9.4 1.8.8
         "
         read spigot
         ;;
       5)
         sleep 1
         clear
         display
         echo "
         Which version you want to use?
         1.19.3 1.18.2 1.17.1 1.16.5 1.15.2 1.14.4 1.13.2 1.12.2 1.11.2 1.10.2 1.9.4 1.8.8
         "
         read purpur
         ;;
       6)
         echo "Bye!"
         break
         ;;
         esac
case $proxy in
       1)
         sleep 1
         clear
         display
         echo "Installing bungeecord please wait."
         curl -sS -o ${JARFILE} https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
         java
         java19
         sleep 5
         clear
         display
         echo "Starting the server."
         proxy
         ;;
       2)
         sleep 1
         clear
         display
         echo "Installing velocity please wait."
         curl -sS -o ${JARFILE} https://api.papermc.io/v2/projects/velocity/versions/3.2.0-SNAPSHOT/builds/219/downloads/velocity-3.2.0-SNAPSHOT-219.jar
         java
         java19
         sleep 5
         clear
         display
         echo "Starting the server."
         proxy
         ;;
       3)
         sleep 1
         clear
         display
         echo "Installing waterfall please wait."
         curl -sS -o ${JARFILE} https://api.papermc.io/v2/projects/waterfall/versions/1.19/builds/510/downloads/waterfall-1.19-510.jar
         mv waterfall-1.19-510.jar ${JARFILE}
         java
         java19
         sleep 5
         clear
         display
         echo "Starting the server."
         proxy
         ;;
       4)
         sleep 1
         clear
         display
         echo "Installing waterfall please wait."
         curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/proxies/flamecord/1.19
         mv flamecord-1.19 ${JARFILE}
         java
         java19
         sleep 5
         clear
         display
         echo "Starting the server."
         proxy
         ;;
       5)
         echo "Bye!"
         break
         ;;
         esac
case $bot in 
       1) 
         echo "Downloading please wait"
         echo "Please Type The Main File Name Example: index.js"  
         read -p "File: " GENERIC_BOT_FILE </dev/tty
         nvm_nodejs
         echo "Starting the server."
         sleep 2s                                
         node ${GENERIC_BOT_FILE}
         exit
	  break   
         ;;   
       2)
         echo "Downloading please wait"
         py_env
         python3 "${GENERIC_BOT_FILE}"
         exit
	  break   
         ;;  
         esac
       
case $paper in
      1.19.3)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.19.3
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.18.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.18.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.17.1)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.19.3
             java
             java17
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.16.5)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.16.5
             java
             java16
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.15.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.15.2
             java
             java14
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.14.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.14.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.13.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.13.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.12.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.12.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.11.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.11.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.10.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.10.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.9.4)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.9.4
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.8.8)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/paper/1.8.8
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
             esac
case $vanilla in
      1.19.3)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.19.3
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.18.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.18.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.17.1)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/paper/1.17.1
             java
             java17
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.16.5)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.16.5
             java
             java16
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.15.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.15.2
             java
             java14
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.14.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.14.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.13.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/vanilla/1.13.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.12.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/vanilla/1.12.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.11.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.11.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.10.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.10.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.9.4)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/vanilla/vanilla/1.9.4
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.8.8)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/vanilla/1.8.8
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
             esac
case $spigot in
      1.19.3)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.19.3
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.18.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.18.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.17.1)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.17.1
             java
             java17
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.16.5)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.16.5
             java
             java16
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.15.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.15.2
             java
             java14
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.14.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.14.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.13.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.13.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.12.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.12.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.11.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.11.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.10.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.10.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.9.4)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.9.4
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.8.8)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/spigot/1.8.8
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
             esac
case $purpur in
      1.19.3)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.19.3
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.18.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.18.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.17.1)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.17.1
             java
             java17
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.16.5)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.16.5
             java
             java16
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.15.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.15.2
             java
             java14
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.14.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.14.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.13.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.13.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.12.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.12.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.11.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.11.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.10.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.10.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.9.4)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.9.4
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.8.8)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/servers/purpur/1.8.8
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
             esac
  case $forge in
     1.19.3)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.19.3
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.18.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.18.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.17.1)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.17.1
             java
             java17
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.16.5)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.16.5
             java
             java16
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.15.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.15.2
             java
             java14
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.14.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.14.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.13.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.13.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.12.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.12.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.11.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.11.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.10.2)
             sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.10.2
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.9.4)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.9.4
             java
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
      1.8.8)
            sleep 1
             echo "Downloading please wait"
             curl -sS -o ${JARFILE} https://serverjars.com/api/fetchJar/modded/forge/1.8.8
             java 
             java19
             clear
             display
             echo "Starting the server."
             launchJavaServer
             ;;
             esac
case $bdsoft in
      1)
        sleep 1
        echo "
        Which version you want to use?
        4.12.8 4.12.7 4.12.6 4.12.5 4.12.4 3.27.0 3.26.5 3.26.4
        "
        read pmmp
        ;;
      2)
        sleep 1
        echo "This software is depricated."
        ;;
      3)
        sleep 1
         echo "Downloading please wait."
       curl -s -O https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.51.01.zip
        unzip bedrock-server-1.19.51.01.zip
        php8
        java
        java19
        clear
        display
        echo "Starting the server."
        LD_LIBRARY_PATH=. ./bedrock_server
        sleep 5
        y
       ;;
       4)
         echo "Bye!"
         break
         ;;
        esac
case $pmmp in
      4.12.8)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/4.12.8
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      4.12.7)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/4.12.7
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      4.12.6)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/4.12.6
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      4.12.5)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/4.12.5
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      4.12.4)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/4.12.4
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      3.27.0)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/3.27.0
             php8
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      3.26.5)
             echo "Downloading please wait."
             curl -sS -o server.phar https://serverjars.com/api/fetchJar/bedrock/pocketmine/3.26.5
             php7
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
      3.26.4)
             echo "Downloading please wait."
             curl -sS -o ${PHARFILE} https://serverjars.com/api/fetchJar/bedrock/pocketmine/3.26.4
             php7
             clear
             display
             echo "Starting the server."
             pmmp
             ;;
             esac
case $voice in
      1)
             sleep 1
             clear
             display
             echo "Installing lavalink server please wait."
             curl -L -o Lavalink.jar https://github.com/freyacodes/Lavalink/releases/latest/download/Lavalink.jar
             curl -L -o application.yml https://raw.githubusercontent.com/freyacodes/Lavalink/master/LavalinkServer/application.yml
             java
             java11
             lavalink
             ;;
      2)
             sleep 1
             TSVERSION=$(curl https://githubusercontent.com/jpylypiw/teamspeak-egg/master/tsversion)
             curl https://files.teamspeak-services.com/releases/server/"$TSVERSION"/teamspeak3-server_linux_amd64-"$TSVERSION".tar.bz2 | tar xj --
             curl -O https://raw.githubusercontent.com/jpylypiw/teamspeak-egg/master/update.sh
             chmod +x update.sh
             teamspeak
             ;;
      3)
             sleep 1
             clear
             display
             echo "Comming soon!"
             ;;
             esac
case $gta in
      1)
         sleep 1
         clear
         display
         echo "Still Being Developed Please Wait." 
         echo "Contact https://afernactyl.me/discord"
       ;;
       2)
         sleep 1
         clear
         display
         echo "Still Being Developed Please Wait." 
         echo "Contact https://afernactyl.me/discord"
       ;;
       esac
case $database in
      1)
          mongodb_enviroment
          echo -e "==============================="
          echo -e "To stop MongoDB server execute following commands:"
          echo -e "use admin"
          echo -e "db.shutdownServer()"
          echo -e "quit()"
          echo -e "==============================="
          sleep 2s
          echo -e "==============================="
          echo -e "Starting MongoDB Server"
          echo -e "==============================="
          export PATH=$PATH:/home/container/mongodb/bin/
          mongod --fork --dbpath /home/container/mongodb/data --port ${SERVER_PORT} --bind_ip 0.0.0.0 --logpath /home/container/mongodb/logs/mongo.log; until nc -z -v -w5 127.0.0.1 ${SERVER_PORT}; do echo 'Waiting for mongodb connection...'; sleep 5; done && mongo 127.0.0.1:${SERVER_PORT} 
          exit
       ;;
       2)
          mariadb_enviroment
          echo -e "==============================="
          echo -e "Starting MariaDB Server"
          echo -e "To stop server" 
          echo -e "Type shutdown; exit;"
          echo -e "==============================="
          sed -i "s|^bind-address.*|bind-address=0.0.0.0|g" .my.cnf
          sed -i "s|^port.*|port = "$SERVER_PORT"|g" .my.cnf
          export PATH=$PATH:/home/container/mariadb/bin/
          export PATH=$PATH:/home/container/mariadb/scripts/
          { mysqld & } && sleep 5 && mysql -u root
          exit
       ;;
       3)
          redis_enviroment
          echo -e "==============================="
          export REDIS_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
          echo -e "Redis Admin Account Password: ${REDIS_PASSWORD}"
          echo -e "==============================="
          sleep 2s
          echo -e "==============================="
          echo -e "Starting Redis Server"
          echo -e "==============================="
          redis-server /home/container/redis.conf --save 60 1 --dir /home/container/ --bind 0.0.0.0 --port ${SERVER_PORT} --requirepass ${REDIS_PASSWORD} --maxmemory ${SERVER_MEMORY}mb --daemonize yes && redis-cli -p ${SERVER_PORT} -a ${REDIS_PASSWORD}; redis-cli -p ${SERVER_PORT} -a ${REDIS_PASSWORD} shutdown save
          exit 
       ;;
       esac