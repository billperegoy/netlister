require_relative 'spec_helper'

describe Port do
  it "can be created and given a name" do
    p = Port.new(name: 'my_port')
    expect(p.name).to eq 'my_port'
  end

  it "can be created and given a direction" do
    p = Port.new(name: 'my_port', type: 'in')
    expect(p.type).to eq 'in'
  end
end
