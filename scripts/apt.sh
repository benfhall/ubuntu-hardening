function f_apt {

mv /etc/apt/sources.list  /etc/apt/sources.list.old

version=$(lsb_release -a) 

apt-get install unattended-upgrades -y
echo 'APT::Periodic::Update-Package-Lists "1";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

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
