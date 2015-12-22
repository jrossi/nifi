require 'spec_helper'

# nifi
describe service('nifi') do
  it {should be_running}
end

describe port(8080) do
  it { should be_listening }
end

# sysctl
describe file('/proc/sys/vm/swappiness') do 
  it { should be_file }
  it { should contain 0 }
end

describe command('sudo sysctl -a | grep "net\.ipv4\.tcp_fin_timeout"') do
  its(:stdout) { should contain '/^net\.ipv4\.tcp_fin_timeout = 1/' }
end

describe command('sudo sysctl -a | grep "net\.ipv4\.ip_local_port_range"') do
  its(:stdout) { should contain '/^net\.ipv4\.ip_local_port_range = 10000\t65000\n/'}
end

# limits
describe file('/etc/security/limits.conf') do
  it { should be_file }
  it { should contain '* hard nofile 50000' }
  it { should contain '* hard nofile 50000' }
  it { should contain '* soft nofile 50000' }
  it { should contain '* hard nproc  10000' }
  it { should contain '* soft nproc  10000' }
end

describe file('/etc/security/limits.d/90-nproc.conf') do
  it { should be_file }
  it { should contain '90-nproc soft nproc 10000' }
end