# cloud-raspi

This is a fork from an Owncloud installation on Raspberry Pi adapted to Nextcloud (on Raspberry Pi 3).

The ´PI_NX_Setup.sh´ file is just a copy from the ´PI_OC_Setup.sh´ file.

Original steps to do for Owncloud:

1. sudo bash PI_OC_Setup.sh
2. sudo bash OC_install.sh
3. copy ngix file to /etc/nginx/sites-available/default
4. modify SSL certificate location
5. sudo /etc/init.d/nginx restart
6. open htts://web/owncloud
