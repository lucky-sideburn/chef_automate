# chef_automate Cookbook
## Cookbook for install Chef Automate
## Testing Chef Automate with Vagrant
## Requirements
  a Chef Server. Change default['chef_automate']['chef_server']['url'] with the correct IP

  an user's key (like admin.pem) of a member of your Chef Server Organization. Change default['chef_automate']['key']['base'] and default['chef_automate']['key']['name'] with your values. If you put it into the cookbook's directory you will find the key on color.Magenta("/vagrant") (guest machine)

  a Virtualbox private network 192.168.56.0 (or you can set a port forwarding into the Vagrantfile in order access to the webserver through http://127.0.0.1)
  
  a delivery.license file. Put it into the cookbook directory. You will see it on /vagrant from your Virtualbox machine

  In your host machine, if you use Vagrant, set "192.168.56.123 automate-box01"

## Usage with Vagrant
  git clone $this_cookbook_from_git OR knife cookbook site download this_cookbook
  vagrant up
  go to https://automate-box01/e/umbrella_corporation/ or use your preferred internal IP or use port forwarding to 127.0.0.1


License and Authors
-------------------
Authors: Eugenio Marzo (eugenio.marzo@sourcesense.com)
Company: Sourcesense
