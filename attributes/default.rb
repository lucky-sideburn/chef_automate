
default['chef_automate']['org'] = "umbrella_corporation"
default['chef_automate']['user'] = "chefadmin"
default['chef_automate']['password'] = "chefadmin"
default['chef_automate']['key']['base'] = "/vagrant"
default['chef_automate']['key']['name'] = "admin.pem"
default['chef_automate']['key']['path'] = File.join(node['chef_automate']['key']['base'],node['chef_automate']['key']['name'])
default['chef_automate']['chef_server']['url'] = "http://33.33.33.10/organizations/umbrella_corporation"

default['chef_automate']['os_family'] = "redhat"
default['chef_automate']['rhel']['rpm']['download_dir'] = "/tmp"
default['chef_automate']['rhel']['rpm']['package_name'] = "delivery-0.5.1-1.el7.x86_64.rpm"
default['chef_automate']['rhel']['rpm']['url'] = "https://packages.chef.io/stable/el/7/#{node['chef_automate']['rhel']['rpm']['package_name']}"

rhel_execute_cmd  = "rpm -Uvh #{node['chef_automate']['rhel']['rpm']['package_name']} ; delivery-ctl setup -l /vagrant/delivery.license -e #{node['chef_automate']['org']} --server-url #{node['chef_automate']['chef_server']['url']} --configure -f #{node['fqdn']} -k #{node['chef_automate']['key']['path']} --build-node &> /tmp/delivery.log"
default['chef_automate']['rhel']['rpm']['execute_this'] = rhel_execute_cmd
