require_relative 'spec_helper'

describe Wire do
  let(:and_gate) do
    mod = Mod.new(name: 'and2')
    mod.add_port Port.new(name: 'a', type: 'in')
    mod.add_port Port.new(name: 'b', type: 'in')
    mod.add_port Port.new(name: 'y', type: 'out')
    mod
  end

  it "can be created with a name" do
    wire = Wire.new(name: "my_net")
    expect(wire.name).to eq "my_net"
  end

  it "has a list of all ports connected to it" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    wire = Wire.new(name: "my_net")
    wire.add_port inst.find_port('a')
    wire.add_port inst.find_port('b')
    expect(wire.port_count).to eq 2
  end
end
