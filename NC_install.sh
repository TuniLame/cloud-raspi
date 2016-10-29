#####
# Nextcloud installation script for Raspberry Pi 3
#####
foldername='nextcloud'
wwpath='/var/www'
ncpath='/var/www/nextcloud'
ncdata='/var/nextcloud'
htuser='www-data'

echo "start Nextcloud install"

## A verifier ou il download le fichier, et ensuite ou il l'extrait

cd ${wwpath}
read -p "Which version do you want to download (and install)? Exemple: 10.0.1 " DLVERSION

wget -O ${wwpath}/nextcloud-${DLVERSION}.tar.bz2 https://download.nextcloud.com/server/releases/nextcloud-${DLVERSION}.tar.bz2

#sudo rm -rf ${wwpath}/foldername

cd ${wwpath}
tar -xjvf nextcloud-${DLVERSION}.tar.bz2
sudo rm ${wwpath}/nextcloud-${DLVERSION}.tar.bz2

sudo find ${ncpath}/ -type f -print0 | xargs -0 chmod 0640
sudo find ${ncpath}/ -type d -print0 | xargs -0 chmod 0750
sudo chown -R root:${htuser} ${ncpath}/
sudo chown -R ${htuser}:${htuser} ${ncpath}/apps/
sudo chown -R ${htuser}:${htuser} ${ncpath}/config/

find ${ncdata}/ -type f -print0 | xargs -0 chmod 0640
find ${ncdata}/ -type d -print0 | xargs -0 chmod 0750
sudo chown -R ${htuser}:${htuser} ${ncdata}/

echo "    create crontabs"
cat <(crontab -u www-data -l) <(echo "*/15 * * * * php -f /var/www/${foldername}/cron.php") | crontab -u www-data -
/etc/init.d/cron restart
