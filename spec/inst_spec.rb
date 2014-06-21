require_relative 'spec_helper'

describe Inst do
  let(:and_gate) do
    mod = Mod.new(name: 'and2')
    mod.add_port Port.new(name: 'a', type: 'in')
    mod.add_port Port.new(name: 'b', type: 'in')
    mod.add_port Port.new(name: 'y', type: 'out')
    mod
  end
  
  it "can create an instance and gets its name" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    inst.name.should == 'u1'
  end

  it "can create an instance and associate it with a module" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    inst.mod_name.should == 'and2'
  end

  it "associates an instance port to each port on the instantiated module" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    inst.port_count.should == 3
  end
end
