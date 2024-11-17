sudo apt update -y
#Update system
sudo apt upgrade -y
#Upgrade system
sudo apt install nginx -y
#install Nginx
sudo systemctl start nginx
#Starts Nginx
sudo systemctl enable nginx
sudo cp index.html /var/www/html
#Copy my index.html file to /car/ww/html path
sudo chmod -R 755 /var/www/html
#Recursive granted permissions to all the files in the path
sudo systemctl reload nginx
#Reloads Nginx
sudo systemctl status nginx
#Show status of Nginx
