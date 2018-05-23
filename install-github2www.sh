#########################
#GIT CLone repo
#########################
#sudo git pull 
sudo git clone https://github.com/vtzoum/git-test

#########################
#Install Python packages
#########################
sudo pip install ./git-test/requirements.txt

#########################
#Change Perms
#########################
#Change Root dir Perms/Owns
sudo chown www-data:www-data ./git-test
sudo chmod 755 ./git-test

cd gradecenter/
#Change DB File Perms
sudo chown www-data:www-data index.html
sudo chmod 755 index.html

#########################
#APACHE2 Conf
#########################
sudo cat <<EOT >> /etc/apache2/sites-available/000-default.conf
########################################
# Application SERVER Instance (:8000) 
# Dir (./gradecenter)
########################################
Listen 8100
NameVirtualHost *:8100
<VirtualHost *:8100>
    ServerAdmin webmaster@mydomain.com
    ServerAlias www.mydomain.com
</VirtualHost>
EOT

#Restart APACHE2
sudo service apache2 restart

