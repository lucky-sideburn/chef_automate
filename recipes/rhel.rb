#
# Cookbook Name:: chef_automate
# Recipe:: thek
#
# Copyright 2016, Sourcesense
#
# All rights reserved - Do Not Redistribute
#
remote_file File.join(node['chef_automate']['rhel']['rpm']['download_dir'],node['chef_automate']['rhel']['rpm']['package_name']) do
  source node['chef_automate']['rhel']['rpm']['url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :run, 'execute[install_rpm]', :immediately
  not_if "rpm -qa | grep ^#{node['chef_automate']['rhel']['rpm']['package_name'].gsub('.rpm','')}\$ "
end

execute 'install_rpm' do
  cwd node['chef_automate']['rhel']['rpm']['download_dir']
  command node['chef_automate']['rhel']['rpm']['execute_this']
  action :nothing
end

execute 'adduser' do
  command "delivery-ctl create-user #{node['chef_automate']['org']} #{node['chef_automate']['user']} --password #{node['chef_automate']['password']} --roles 'admin' "
  not_if "delivery-ctl list-users #{node['chef_automate']['org']} | grep ^#{node['chef_automate']['user']}\$"
end
