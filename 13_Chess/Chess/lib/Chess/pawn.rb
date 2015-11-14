# lib/pawn.rb

module Chess
  class Pawn < Piece
    
	def initialize(input)
	  super
	  @token = color == "white" ? "\u2659" : "\u265F" 
	  @possible_moves = color == "white" ? [[1,0],[2,0],[1,1],[1,-1]] : [[-1,0],[-2,0],[-1,-1],[-1,1]]
	end
	
	def valid_move?(board, target)
	  curr_x, curr_y = map_loc(@loc)
	  tar_x, tar_y = map_loc(target)
	  puts "[#{curr_x}, #{curr_y}] => [#{tar_x}, #{tar_y}]"
	  if(good_move?(board, target))
	    
		@possible_moves.each_with_index do |p, idx|
		  x, y = curr_x + p[0], curr_y + p[1]
		  next unless (x.between?(0,7) && y.between?(0,7))
#=begin
		  case idx
		  when 0
			return true if(x==tar_x && y==tar_y && board.get_location(target).nil?)
		  when 1
			return true if(x==tar_x && y==tar_y &&(@color=="white" && curr_x == 1||@color=="black" && curr_x==6))
		  when 2
		    return true if(x==tar_x && y==tar_y) && !friend?(board.get_location(target))
		  when 3
		    return true if(x==tar_x && y==tar_y) && !friend?(board.get_location(target))
		  end
#=end
		  #return true if (x === tar_x && y === tar_y)
		end
		false
	  end
	end
	
	def promote?
	  curr_x, curr_y = map_loc(@loc)
	  return true if (color == "white" && curr_x == 7) || (color=="black" && curr_x==0)
	end
	
	def to_s
	  @token
	end
  end
end
