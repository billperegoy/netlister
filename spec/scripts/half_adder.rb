def build_half_adder
  xor_gate = Mod.new(name: 'xor')
  xor_gate.add_port Port.new(name: 'a', type: 'in')
  xor_gate.add_port Port.new(name: 'b', type: 'in')
  xor_gate.add_port Port.new(name: 'y', type: 'out')

  and_gate = Mod.new(name: 'and2')
  and_gate.add_port Port.new(name: 'a', type: 'in')
  and_gate.add_port Port.new(name: 'b', type: 'in')
  and_gate.add_port Port.new(name: 'y', type: 'out')

  a_port = Port.new(name: 'a', type: 'in')
  b_port = Port.new(name: 'b', type: 'in')
  s_port = Port.new(name: 's', type: 'out')
  co_port = Port.new(name: 'co', type: 'out')

  half_adder = Mod.new(name: 'half_adder')
  half_adder.add_port a_port
  half_adder.add_port b_port
  half_adder.add_port s_port
  half_adder.add_port co_port

  xor_inst = Inst.new(name: 'u1', mod: xor_gate)
  and_inst = Inst.new(name: 'u2', mod: and_gate)

  half_adder.add_inst xor_inst
  half_adder.add_inst and_inst

  a_wire = Wire.new(name: 'a', mod: half_adder)
  b_wire = Wire.new(name: 'b', mod: half_adder)
  s_wire = Wire.new(name: 's', mod: half_adder)
  co_wire = Wire.new(name: 'co', mod: half_adder)

  a_wire.add_port xor_inst.find_port('a')
  a_wire.add_port and_inst.find_port('a')

  # FIXME - Do we need an insatnce port here?
  # a_wire.add_port a_port

  b_wire.add_port xor_inst.find_port('b')
  b_wire.add_port and_inst.find_port('b')
  # b_wire.add_port b_port

  s_wire.add_port xor_inst.find_port('y')
  # s_wire.add_port s_port

  co_wire.add_port and_inst.find_port('y')
  # co_wire.add_port co_port

  half_adder
end
