require_relative 'spec_helper'

describe Net do
  it "can be created with a name" do
    n = Net.new(name: "my_net")
    expect(n.name).to eq "my_net"
  end
end
