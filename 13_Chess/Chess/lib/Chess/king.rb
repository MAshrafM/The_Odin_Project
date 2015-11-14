# lib/king.rb

module Chess

  class King < Piece
  
    def initialize(input)
	  super
	  @token = color == "white" ? "\u2654" : "\u265a"
	  @possible_moves = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [-1,-1], [1,-1], [-1,1]]
	end
	
	def valid_move?(board, target)
	    if castle?(color, board)
		  @possible_moves << [0,2]
		end
		
		curr_x, curr_y = map_loc(@loc)
		tar_x, tar_y = map_loc(target)
		puts "[#{curr_x}, #{curr_y}] => [#{tar_x}, #{tar_y}]"
		if(good_move?(board, target))
		  @possible_moves.each do |p|
			x, y = curr_x + p[0], curr_y + p[1]
			next unless (x.between?(0,7) && y.between?(0,7))
			return true if (x==tar_x && y==tar_y)
		  end
		end
		false
    end
	
	def castle?(color, board)
	  if color == "white" &&
	    board.get_location("e1").is_a?(King) && board.get_location("h1").is_a?(Rook) && board.get_location("f1").nil? && board.get_location("g1").nil?
		return true
	  elsif color == "black" &&
	    board.get_location("e8").is_a?(King) && board.get_location("h8").is_a?(Rook) && board.get_location("f8").nil? && board.get_location("g8").nil?
		return true
	  end
	  false
	end
	
	def to_s
	  @token
	end
  end
end
