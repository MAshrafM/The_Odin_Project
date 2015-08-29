# spec/node_spec

require "spec_helper"

module BinTrees
  describe Node do
    context "#initialize" do
	  it "raise an exception when init no value" do
	    expect{Node.new()}.to raise_error
	  end
	  
	  it "init node value" do
	    node = Node.new(4)
		expect(node.value).to be 4
	  end
	  
	  it "child work" do
	    node = Node.new(4)
		node.left_child = 5
		expect(node.left_child).to be 5
	  end
	  
	  it "child nil" do
	    node = Node.new(4)
		node.left_child = 5
		expect(node.right_child).to be nil
	  end
	end
  end
end
