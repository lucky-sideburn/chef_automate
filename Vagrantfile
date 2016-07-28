VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "geerlingguy/centos7"
  config.vm.box = "geerlingguy/centos7"
  # The machine hostname
  config.vm.hostname = "automate-box01"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.10.12"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.

  config.vm.network "private_network", ip: "192.168.56.123"

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.arguments = '-Fdoc'
    chef.roles_path = "./chef/roles"

    chef.run_list =  [
      "recipe[chef_automate::default]"
    ]

    config.berkshelf.enabled = true

    # You may also specify custom JSON attributes:
    config.vm.provider :virtualbox do |vb|
      ## Don't boot with headless mode
      vb.gui = false
      #
      ## Use VBoxManage to customize the VM. For example to change memory:
      # vb.customize ["modifyvm", :id, "--memory", "1024"]
      # Enable shared clipboard
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    end
  end
end
