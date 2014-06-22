require_relative 'spec_helper'

describe Mod do
  it "can create a module with a name" do
    m = Mod.new(name: 'and2')
    expect(m.name).to eq 'and2'
  end

  it "can add a single port to a module" do
    m = Mod.new(name: 'and2')
    m.add_port Port.new(name: 'a', type: 'in')
    expect(m.port_count).to eq 1
  end

  it "can add multiple ports to a module" do
    m = Mod.new(name: 'and2')
    m.add_port Port.new(name: 'a', type: 'in')
    m.add_port Port.new(name: 'b', type: 'in')
    expect(m.port_count).to eq 2
  end

  it "can add an instance to a module" do
    top_mod = Mod.new(name: 'my_mod')
    and_gate = Mod.new(name: 'and2')
    inst = Inst.new(name: 'u1', mod: and_gate)
    top_mod.add_inst(inst)
    expect(top_mod.inst_count).to eq 1
  end

  it "can create a comples multi level module successfully" do
    half_adder = build_half_adder
    expect(half_adder.port_count).to eq 4
    expect(half_adder.inst_count).to eq 2
    expect(half_adder.wire_count).to eq 4
  end
end
