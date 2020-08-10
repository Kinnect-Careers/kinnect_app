# Kinnect Careers App

## 1. Vagrant + Oracle Virtual Box
### Containerizing application environmemnt
First download and install vagrant: https://www.vagrantup.com/downloads.html \
Download and install Oracle VM VirtualVox

## 2. In a designated directory, create a file named Vagrantfile
You will need to be located in this directory in order to activate vagrant
``` Vagrantfile
# Use version 2 of Vagrant config language
Vagrant.configure("2") do |config|
  # OS to be installed
  config.vm.box = "ubuntu/bionic64"

  # Set VM to give only 4G of memory
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  # This will allow you to access port 3000 when the VM is running rails
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Mounts current directory to directory /path_to_files, inside VM 
  # Change /path_files to a directory of your choice
  config.vm.synced_folder ".", "/path_files"
end
```

## 3. On the command line do
```
# Vagrant will install the OS and manage it with VB
vagrant up
# Connect through ssh to container
vagrant ssh
```

## 4. In the container do
```
sudo apt-get update

# install base libraries for binary building etc
sudo apt-get install -y autoconf bison build-essential curl g++ gcc git libffi-dev
sudo apt-get install -y libgconf-2-4 libgdbm-dev libncurses5-dev libreadline-dev
sudo apt-get install -y libsqlite3-dev libssl-dev libxi6 libyaml-dev make sqlite3
sudo apt-get install -y xvfb zip zlib1g-dev

# Register repo and install nodejs 
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Check node was sussefully installed
node --version

# Register repo and install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

# Install ruby and rails
curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

# Ensures the shims are up-to-date and enables Bash command completion
eval "$(rbenv init -)" 
source ~/.bashrc

rbenv install 2.6.3
rbenv global 2.6.3
gem install rails --version=6.03 --no-document

# Install chrome driver
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable
wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
```

## 5. Configure git

## 6. Clone this repository 
```
git clone https://github.com/Kinnect-Careers/kinnect_app.git
```

## 7. Test if everything passes in your environment
```
cd kinnect_app
# install all dependencies
bundle install
# Test
rails test
# all tests should be GREEN
```

## 8. Serve application by directing it towards port 3000
```
rails s -b 0.0.0.0
```
