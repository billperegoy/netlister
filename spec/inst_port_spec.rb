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
    inst_port.name.should == 'b'
  end
end
