#
# Cookbook Name:: nifi
# Recipe:: java
#
# Copyright (C) 2015 ULIVE / Scripps Networks Interactive
#
# All rights reserved - Do Not Redistribute
#
execute 'apt-get update'
include_recipe 'java::default'