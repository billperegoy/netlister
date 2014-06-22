# This class represent a wire that connects multiple instance
# ports.
#
class Wire
  attr_reader :name

  def initialize(opts)
    @name = opts[:name]
    @mod = opts[:mod]
    @ports = {}

    @mod.add_wire(self) if @mod
  end

  def add_port(port)
    port.connect_to_net(self)
    @ports[port.name] = port
  end

  def port_count
    @ports.length
  end
end
