require 'spec_helper'

describe service('nifi') do
  it {should be_running}
end

describe port(8080) do
  it { should be_listening }
end