# lib/build_tree.rb

module BinTrees
  class BuildTree
    attr_accessor :source, :tree
	def initialize(arr)
	  @source = nil
	  @tree = []
	  build(arr)
	end
	
	def build(arr)
	  arr.each{|i| @tree << leaf_in(i, @source)}
	end
	
	def leaf_in(value, current)
	  if @source.nil?
	    @source = Node.new(value)
	  elsif value <= current.value
		  if current.left_child.nil?
		    current.left_child = Node.new(value)
		  else
		    leaf_in(value, current.left_child)
		  end
	  elsif value >= current.value
		  if current.right_child.nil?
		    current.right_child = Node.new(value)
		  else
		    leaf_in(value, current.right_child)
		  end
	  end	
	end
	
	
  end
end
