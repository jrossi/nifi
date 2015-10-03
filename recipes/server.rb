#
# Cookbook Name:: nifi
# Recipe:: default
#
# Copyright (C) 2015 ULIVE / Scripps Networks Interactive
#
# All rights reserved - Do Not Redistribute
#

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
  service nifi start
  EOH
end