#
# Cookbook Name:: nifi
# Recipe:: _sysctl
#

include_recipe 'sysctl::default'

# setting for ubuntu
sysctl_param 'net.ipv4.tcp_fin_timeout' do
  value 1
end

sysctl_param 'net.ipv4.ip_local_port_range' do
  value "10000 65000"
end

sysctl_param 'vm.swappiness' do
  value 0
end