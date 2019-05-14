#!/bin/bash
#==============================================
#LINUX MINT DISABLE SYSTEM SERVICES
#DEV v0r0n0v
#v.1.0
#==============================================

echo -e "\e[32mWELCOME - SERVICES WILL BE DISABLED\e[0m"
echo -e "\e[32m ===============START=================== \e[0m"
service avahi-daemon stop  > /dev/null
echo -e "\e[32mservice avahi-daemon - complate\e[0m"
update-rc.d avahi-daemon disable > /dev/null
echo -e "\e[32mupdate-rc.d disable - complate\e[0m"
sleep 5

systemctl disable avahi-daemon > /dev/null
echo -e "\e[32mdisable avahi-daemon - complate\e[0m"
sleep 10
apt-get purge avahi-daemon -y > /dev/null
echo -e "\e[32mpurge avahi-daemon - complate\e[0m"
sleep 10
sudo /etc/init.d/ntp stop > /dev/null
echo -e "\e[32mntp stop - complate\e[0m"
sleep 5
sudo update-rc.d -f ntp remove > /dev/null
echo -e "\e[32mntp remove - complate\e[0m"
sleep 10
systemctl disable ntp > /dev/null
echo -e "\e[32mcups disable - complate\e[0m"

/etc/init.d/cups stop > /dev/null

systemctl stop cups > /dev/null
echo -e "\e[32mcups stop - complate\e[0m"
systemctl stop cups-browsed > /dev/null
echo -e "\e[32mcups browsed stop - complate\e[0m"
systemctl disable cups > /dev/null
systemctl disable cups-browsed > /dev/null
sleep 5
echo -e "\e[32mNETWORKING STATUS\e[0m"
netstat -plunt
echo -e "\e[32m===============END===================\e[0m"
exit 0
