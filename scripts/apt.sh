function f_apt {

mv /etc/apt/sources.list  /etc/apt/sources.list.old

version=$(lsb_release -a) 

if [[ $version =~ .*14.04* ]]
then
    mv defaults/sources14.list /etc/apt/sources.list
else
    if [[ $version =~ .*16.04* ]]
    then
        mv defaults/sources16.list /etc/apt/sources.list
    else
        echo "UNKNOWN VERSION! ENDING SCRIPT"
        exit
    fi
fi

  
  
  
  apt-get update -y

}
