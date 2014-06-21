require_relative 'spec_helper'

describe Port do
  it "can be created and given a name" do
    p = Port.new(name: 'my_port')
    p.name.should == 'my_port'
  end

  it "can be created and given a direction" do
    p = Port.new(name: 'my_port', type: 'in')
    p.type.should == 'in'
  end
end
