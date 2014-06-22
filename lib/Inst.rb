# This class represents an instantiated module.
#
class Inst
  attr_reader :name, :ports

  def initialize(opts)
    @name = opts[:name]
    @mod = opts[:mod]
    @ports = {}

    check
    create_inst_ports
  end

  def port_count
    @ports.length
  end

  def mod_name
    @mod.name
  end

  def find_port(name)
    @ports[name]
  end

  private
  def check
    raise "New Inst must reference a module" unless @mod
    raise "New Inst must have a name" unless @name
  end

  def create_inst_ports
    @mod.ports.each_key do |name|
      @ports[name] = InstPort.new(port: @mod.find_port(name))
    end
  end
end
