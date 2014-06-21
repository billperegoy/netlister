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
    expect(inst.name).to eq 'u1'
  end

  it "can create an instance and associate it with a module" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    expect(inst.mod_name).to eq 'and2'
  end

  it "associates an instance port to each port on the instantiated module" do
    inst = Inst.new(name: 'u1', mod: and_gate)
    expect(inst.port_count).to eq 3
  end
end
