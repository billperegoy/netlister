# This class represents a module. Note that modules can be
# instantiated multiple times.
#
class Mod
  attr_reader :name, :ports

  def initialize(opts)
    @name = opts[:name]
    @ports = {}
    @insts = {}
    @wires = {}
  end

  def add_port(port)
    @ports[port.name] = port
  end

  def port_count
    @ports.length
  end

  def add_inst(inst)
    @insts[inst.name] = inst
  end

  def add_wire(wire)
    @wires[wire.name] = wire
  end

  def inst_count
    @insts.length
  end

  def wire_count
    @wires.length
  end

  def find_port(name)
    @ports[name] || NullPort.new
  end
end
