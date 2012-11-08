
cd `dirname "$0"`

setup_path=`pwd`

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
# sudo chown -r blog:blog /home/blog

# # Clone repo
# rm -rf ~/blog
# git clone git@github.com:ericvicenti/blog.git ~/blog

# # Install configs
sudo service monit stop
sudo service blog stop

sudo cp -f $setup_path/upstart.conf /etc/init/blog.conf
sudo chown root:root /etc/init/blog.conf

sudo cp -f $setup_path/monitrc /etc/monit/monitrc
sudo chown root:root /etc/monit/monitrc

sudo cp -f $setup_path/nginx/vhost.conf /etc/nginx/sites-available/blog.org.conf
sudo chown root:root /etc/nginx/sites-available/blog.org.conf

sudo ln -s /etc/nginx/sites-available/blog.org.conf /etc/nginx/sites-enabled/blog.org.conf

sudo service nginx restart
sudo service monit start
sudo service blog start