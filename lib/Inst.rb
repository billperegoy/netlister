class Inst
  attr_reader :name

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

  private
  def check
    raise "New Inst must reference a module" unless @mod
    raise "New Inst must have a name" unless @name
  end

  def create_inst_ports
    @mod.ports.each_key do |name|
      @ports[name] = p
    end
  end
end