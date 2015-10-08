#
# Cookbook Name:: nifi
# Recipe:: default
#

include_recipe 'nifi::_limits'
include_recipe 'nifi::_sysctl'
include_recipe 'nifi::java'
include_recipe 'nifi::server'