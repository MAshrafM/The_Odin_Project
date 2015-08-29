# spec/bfs_spec

require "spec_helper"

module BinTrees
  describe DFSRec do
    context "#initialize" do
	  it "don't raise an exception when init" do
	    expect{DFSRec.new()}.to raise_error
	  end
      
	  it " test solution" do
		arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
		target = 324
		d = DFSRec.new(arr, target)
		expect(d.sol).to_not eq nil  
	  end
	  
	  it " test solution" do
		arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
		target = 66
		d = DFSRec.new(arr, target)
		expect(d.sol).to be nil
		  
	  end
	end

  end
end
