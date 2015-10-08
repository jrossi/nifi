#
# Cookbook Name:: nifi
# Recipe:: default
#
include_recipe 'nifi::_limits'
include_recipe 'nifi::_sysctl'

ark 'nifi' do
  url "#{node['nifi']['package_url']}"
  version "#{node['nifi']['version']}"
  action :install
end

script "install_nifi" do
  interpreter "bash"
  user "root"
  code <<-EOH
  #{node['ark']['prefix_home']}/nifi/bin/nifi.sh install
  EOH
end

service 'nifi' do
  action :enable
  action :start
end
