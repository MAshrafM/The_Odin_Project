# lib/board

class Board
  attr_accessor :cells, :kmoves
  def initialize
    @cells = []
	(0..7).each do |j|
	  @cells.push([])
	  (0..7).each do |i|
	    @cells[j].push(Cell.new)
	  end
	end
	build_tree
  end
  
  def build_tree
    @kmoves = [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
    (0..7).each do |j|
	  (0..7).each do |i|
	    @kmoves.each do |move|
		  @cells[i][j].link.push([i + move[0], j + move[1]]) if ((i + move[0]).between?(0,7) && (j + move[1]).between?(0,7))
		end
	  end
	end
  end
end
