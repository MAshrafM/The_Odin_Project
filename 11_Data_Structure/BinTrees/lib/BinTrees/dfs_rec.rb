# lib/dfs_rec.rb

module BinTrees
  class DFSRec
    attr_accessor :graph, :sol

    def initialize (arr, target)
	  g = BuildTree.new(arr)
	  @graph = g.tree
	  @current = @graph.pop
	  @sol = solve(target, @current)  
	end
	
	def solve(target, current)
	  return nil if current.nil?
	  return current if current.value == target
	  
	  left = solve(target, current.left_child)
	  return left if !left.nil?
	  right = solve(target, current.right_child)
	  return right if !right.nil?
	end
	
	
  end
end