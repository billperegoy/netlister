require_relative 'spec_helper'

describe Wire do
  it "can be created with a name" do
    wire = Wire.new(name: "my_net")
    expect(wire.name).to eq "my_net"
  end
end
