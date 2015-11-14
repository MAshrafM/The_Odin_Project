# lib/queen.rb

module Chess

  class Queen < Piece
    
	def initialize(input)
	  super
	  @token = color == "white" ? "\u2655" : "\u265b"
	  @possible_moves = [[-1,0], [-1,1], [1,-1], [0,1], [0,-1], [1,1], [1,0], [-1,-1]]
	end
	
	def valid_move?(board, target)
	  curr_x, curr_y = map_loc(@loc)
	  tar_x, tar_y = map_loc(target)
	  puts "[#{curr_x}, #{curr_y}] => [#{tar_x}, #{tar_y}]"
	  if(good_move?(board, target))
	  #obstruction
		@possible_moves.each do |step|
		  next_cell_x, next_cell_y = curr_x, curr_y
		  loop do
			next_cell_x += step[0]
			next_cell_y += step[1]
			return true if next_cell_x == tar_x && next_cell_y == tar_y
			break unless (next_cell_x.between?(0,7) && next_cell_y.between?(0,7))
			
			unless board.board[next_cell_x][next_cell_y].nil?
			  puts "obstacle in the path"
			  break
			end
			
		  end
		end
	  end
	  false
	end
	
	def to_s
	  @token
	end
  end
end
