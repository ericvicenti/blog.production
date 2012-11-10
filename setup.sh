
cd `dirname "$0"`

setup_path=`pwd`

HOST=projectopencontent.org

# # Install Dependencies
# sudo apt-get install python-software-properties
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get -y install nodejs npm
# sudo apt-get -y install git monit
# sudo apt-get -y install build-essential g++

# # Set up user
# sudo useradd blog
# sudo mkdir /home/blog
# sudo mkdir /home/blog/log
# sudo chown -R blog:blog /home/blog

# # Clone repo
# rm -rf ~/blog
# git clone git@github.com:ericvicenti/blog.git ~/blog

# # Set up iptables forwarding for HTTPS
# sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 44300
# sudo sh -c "iptables-save -c > /etc/iptables.conf"

# # Install configs
sudo service blog stop

sudo cp -f $setup_path/upstart.conf /etc/init/blog.conf
sudo chown root:root /etc/init/blog.conf

sudo cp -f $setup_path/nginx/vhost.conf /etc/nginx/sites-available/$HOST.conf
sudo chown root:root /etc/nginx/sites-available/$HOST.conf

sudo ln -s /etc/nginx/sites-available/$HOST.conf /etc/nginx/sites-enabled/$HOST.conf

sudo service nginx restart
sudo service blog start