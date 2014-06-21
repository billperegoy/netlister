class InstPort
  def initialize(opts)
    @mod_port = opts[:port]
  end

  def name
    @mod_port.name
  end
end
