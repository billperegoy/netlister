# This class represents a port on a module instance.
#
class InstPort
  attr_reader :net

  def initialize(opts)
    @mod_port = opts[:port]
    @net = nil
  end

  def name
    @mod_port.name
  end

  def connect_to_net(net)
    @net = net
  end
end
