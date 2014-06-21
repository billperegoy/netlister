require_relative 'spec_helper'

describe InstPort do
  let(:and_gate) do
    mod = Mod.new(name: 'and2')
    mod.add_port Port.new(name: 'a', type: 'in')
    mod.add_port Port.new(name: 'b', type: 'in')
    mod.add_port Port.new(name: 'y', type: 'out')
    mod
  end

  it "can create an instance port and associate it with a module port" do
    mod_port = and_gate.find_port('b')
    inst_port = InstPort.new(port: mod_port)
    expect(inst_port.name).to eq 'b'
  end

  it "can connect an instance port to a net" do
    mod_port = and_gate.find_port('b')
    inst_port = InstPort.new(port: mod_port)
    inst_port.connect_to_net Wire.new(name: "my_net")
    expect(inst_port.net.name).to eq "my_net"
  end
end
