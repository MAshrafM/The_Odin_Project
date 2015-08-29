# spec/buildtree_spec

require "spec_helper"

module BinTrees
  describe BuildTree do
    context "#initialize" do
	  it "don't raise an exception when init" do
	    expect{BuildTree.new()}.to raise_error
	  end
	  
	  it "return nil" do
	    tree = BuildTree.new([])
		expect(tree.source).to be nil
	  end
	end

	context "#build" do
	  arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
	  t = BuildTree.new(arr)
	  p t.tree
	  t.tree.each {|i| puts "#{i} value: #{i.value if !i.nil?} left: #{i.left_child.value if !i.left_child.nil?} right: #{i.right_child.value if !i.right_child.nil?}"}
	end

  end
end
