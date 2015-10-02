#
# Cookbook Name:: nifi
# Recipe:: default
#
# Copyright (C) 2015 ULIVE / Scripps Networks Interactive
#
# All rights reserved - Do Not Redistribute
#
execute 'apt-get update'

package 'curl' do
  action [:install]
end

directory "#{node['nifi']['install_dir']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

script "install_nifi" do
  interpreter "bash"
  user "root"
  code <<-EOH
  curl #{node['nifi']['package_url']} -o #{node['nifi']['install_dir']}/nifi-0.3.0-bin.tar.gz
  cd #{node['nifi']['install_dir']}
  tar zxvf #{node['nifi']['version']}-bin.tar.gz
  #{node['nifi']['version']}/bin/nifi.sh install
  service nifi start
  EOH
end