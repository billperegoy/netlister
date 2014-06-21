class Mod
  attr_reader :name, :ports

  def initialize(opts)
    @name = opts[:name]
    @ports = {}
    @insts = {}
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

  def inst_count
    @insts.length
  end

  def find_port(name)
    @ports[name] || NullPort.new
  end
end
