#
# Cookbook Name:: chef_automate
# Recipe:: default
#
# Copyright 2016, Sourcesense
#
# All rights reserved - Do Not Redistribute
#

directory node['chef_automate']['key']['base'] do
  owner "root"
  group "root"
end

include_recipe "chef_automate::#{node[:platform_family]}"

