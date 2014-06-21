require_relative 'spec_helper'

describe Mod do
  it "can create a module with a name" do
    m = Mod.new(name: 'and2')
    m.name.should == 'and2'
  end

  it "can add a single port to a module" do
    m = Mod.new(name: 'and2')
    m.add_port Port.new(name: 'a', type: 'in')
    m.port_count.should == 1
  end

  it "can add multiple ports to a module" do
    m = Mod.new(name: 'and2')
    m.add_port Port.new(name: 'a', type: 'in')
    m.add_port Port.new(name: 'b', type: 'in')
    m.port_count.should == 2
  end

  it "can add an instance to a module" do
    top_mod = Mod.new(name: 'my_mod')
    and_gate = Mod.new(name: 'and2')
    inst = Inst.new(name: 'u1', mod: and_gate) 
    top_mod.add_inst(inst)
    top_mod.inst_count.should == 1
  end
end
