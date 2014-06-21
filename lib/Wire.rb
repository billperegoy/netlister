# This class represent a wire that connects multiple instance
# ports.
#
class Wire
  attr_reader :name

  def initialize(opts)
    @name = opts[:name]
  end
end
