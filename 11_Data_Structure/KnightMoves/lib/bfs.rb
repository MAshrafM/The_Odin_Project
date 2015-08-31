# lib/bfs

class BFS
  attr_accessor :way
  def initialize(source, target)
    @b = Board.new
	@way = {}
	solve(source, target)
  end
  
  def solve(source, target)
	q = [source]
	visited = []
	until q.empty?
	  pos = q.shift
	  visited << pos
	  jump = @b.cells[pos[0]][pos[1]].link
	  jump.each do |j|
	    q.unshift(j) if j && !visited.include?(j)
		way[j] = pos unless way.has_key?(j)
		return if j == target
	  end
	end
	
  end
end