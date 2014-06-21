# This class represent a net that connects multiple instance
# ports.
#
class Net
  attr_reader :name

  def initialize(opts)
    @name = opts[:name]
  end
end
