require 'spec_helper'

describe 'nifi::server' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  it 'does something' do
    skip 'Replace this with meaningful tests'
  end

end

describe service('nifi') do
  it {should be_enabled}
  it {should be_running}
end

describe port(8080) do
  it { should be_listening }
end