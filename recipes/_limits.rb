#
# Cookbook Name:: nifi
# Recipe:: _limits
#

set_limit '*' do
  type 'hard'
  item 'nofile'
  value 50000
  use_system true
end

set_limit '*' do
  type 'soft'
  item 'nofile'
  value 50000
  use_system true
end

set_limit '*' do
  type 'hard'
  item 'nproc'
  value 10000
  use_system true
end

set_limit '*' do
  type 'soft'
  item 'nproc'
  value 10000
  use_system true
end

set_limit '90-nproc' do
  type 'soft'
  item 'nproc'
  value 10000
end