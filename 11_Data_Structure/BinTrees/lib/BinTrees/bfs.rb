# lib/bfs.rb

module BinTrees
  class BFS
    attr_reader :graph, :sol, :way

    def initialize (arr, target)
	  g = BuildTree.new(arr)
	  @graph = g.tree
	  @way = []
	  @sol = solve(target)
	end
	
	def solve(target)
	  until @graph.empty?
	    current = @graph.shift
		@way << current
		
		if target == current.value
		  return current
		else
		  @graph.unshift(current.left_child) if current.left_child
		  @graph.unshift(current.right_child) if current.right_child
		end
	  end
	  #p "not found"
	  nil
	end
  end
end
