# This class represents a module port.
#
class Port
  attr_reader :name, :type

  def initialize(opts)
    @name = opts[:name]
    @type = opts[:type]
  end
end
