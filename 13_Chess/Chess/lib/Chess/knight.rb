# lib/knight.rb

module Chess
  class Knight < Piece
  
	  def initialize(input)
		super
		@token = color == "white" ? "\u2658" : "\u265E"
		@possible_moves = [[2,1],[-2,1],[-2,-1],[-1,2],[-1,-2],[2,-1],[1,2],[1,-2]]
	  end
	  
	  def valid_move?(board, target)
		curr_x, curr_y = map_loc(@loc)
		tar_x, tar_y = map_loc(target)
		puts "[#{curr_x}, #{curr_y}] => [#{tar_x}, #{tar_y}]"
		if(good_move?(board, target))
		  @possible_moves.each do |p|
			x, y = curr_x + p[0], curr_y + p[1]
			next unless (x.between?(0,7) && y.between?(0,7))
			return true if (x===tar_x && y===tar_y)
		  end
		  false
		end
	  end
	  
	  def to_s
		@token
	  end
  end
end
