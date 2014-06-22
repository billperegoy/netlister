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

  def to_verilog
    verilog_module_header +
    verilog_module_port_list +
    verilog_inst_list +
    verilog_endmodule
  end

  private
  def verilog_module_header
    "module #{@name}(#{verilog_module_ports})\n"
  end

  def verilog_endmodule
    "endmodule\n"
  end

  def verilog_module_ports
    names = []
    @ports.each do |k, v|
      names << v.name
    end
    names.join(',')
  end

  def verilog_module_port_list
    port_str = ''
    @ports.each_key do |p|
      port_str += verilog_module_port(@ports[p])
    end
    port_str
  end

  def verilog_module_port(port)
    case port.type
    when 'in'
      "  input #{port.name};\n"
    when 'out'
      "  output #{port.name};\n"
    end
  end

  def verilog_inst_list
    str = ''
    @insts.each_key do |i|
      str += verilog_inst(@insts[i])
    end
    str
  end

  def verilog_inst(inst)
    "  #{inst.mod_name} #{inst.name}(\n" +
    verilog_inst_port_conns(inst) +
    "  );\n"
  end

  def verilog_inst_port_conns(inst)
    inst_port_list = []
    inst.ports.each_key do |p|
      if inst.ports[p].net
        net_connection = inst.ports[p].net.name
      else
        net_connection = ''
      end
      inst_port_list << "         .#{p}(#{net_connection})"
    end
    inst_port_list.join(",\n") + "\n"
  end
end
