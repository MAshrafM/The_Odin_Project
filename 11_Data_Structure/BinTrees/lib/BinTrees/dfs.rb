# lib/dfs.rb

module BinTrees
  class DFS
      attr_accessor :graph, :sol, :way

    def initialize (arr, target)
	  g = BuildTree.new(arr)
	  @graph = g.tree
	  @way = []
	  @sol = solve(target)
	end
	
	def solve(target)
	  until @graph.empty?
	    current = @graph.pop
		@way << current
		
		if target == current.value
		  return current
		else
		  @graph.push(current.left_child) if current.left_child && !way.include?(current.left_child)
		  @graph.push(current.right_child) if current.right_child && !way.include?(current.right_child)
		end
	  end
	  #p "not found"
	  nil
	end
  end
end
