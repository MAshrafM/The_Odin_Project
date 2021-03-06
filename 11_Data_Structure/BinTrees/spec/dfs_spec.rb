# spec/bfs_spec

require "spec_helper"

module BinTrees
  describe DFS do
    context "#initialize" do
	  it "don't raise an exception when init" do
	    expect{DFS.new()}.to raise_error
	  end
      
	  it " test solution" do
		arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
		target = 324
		d = DFS.new(arr, target)
		expect(d.sol).to_not be nil  
	  end
	  
	  it " test solution" do
		arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
		target = 66
		d = DFS.new(arr, target)
		expect(d.sol).to be nil
		  
	  end
	  
	  it "find a way" do
		arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
		target = 8
		d = DFS.new(arr, target)
		d.way.each{|i| puts i.value}
	  end
	end

  end
end
