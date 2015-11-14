# lib/board

module Chess
  class Board
      attr_reader :board
	def initialize(board = nil)
	  @board = board || populate_board
	  populate_board
	  
	end

	def get_location(loc)
	  x, y = map_loc(loc)
	  @board[x][y] 
	end
	
	def set_location(loc, value)
	  x, y = map_loc(loc)
	  @board[x][y] = value
	  unless value.nil?
		value.loc = loc
	  end
	end
	
	
	
	def map_loc(loc)
	  tempx, tempy = loc.split('')
	  y = tempx.upcase.ord - 65
	  x = tempy.to_i - 1
	  [x, y]
	end
	
	def populate_board
	  board = Array.new(8){Array.new(8)}
	  # add white pawns 
	  ('a'..'h').each_with_index do |i, idx|
	    board[1][idx] = Pawn.new(color:"white", location:"#{i}2")
		board[6][idx] = Pawn.new(color:"black", location:"#{i}7")
	  end
	  # add rook
	  board[0][0] = Rook.new(color: "white", location:"a1")
	  board[0][7] = Rook.new(color: "white", location:"h1")
	  board[7][0] = Rook.new(color:"black", location:"a8")
	  board[7][7] = Rook.new(color:"black", location:"h8")
	  
	  # add knights
	  board[0][1] = Knight.new(color:"white", location:"b1")
	  board[0][6] = Knight.new(color:"white", location:"g1")
	  board[7][1] = Knight.new(color:"black", location:"b8")
	  board[7][6] = Knight.new(color:"black", location:"g8")
	  
	  # add bishops
	  board[0][2] = Bishop.new(color:"white", location:"c1")
	  board[0][5] = Bishop.new(color:"white", location:"f1")
	  board[7][2] = Bishop.new(color:"black", location:"c8")
	  board[7][5] = Bishop.new(color:"black", location:"f8")
	  
	  # add king and queen
	  board[0][4] = King.new(color:"white", location:"e1")
	  board[0][3] = Queen.new(color:"white", location:"d1")
	  board[7][4] = King.new(color:"black", location:"e8")
	  board[7][3] = Queen.new(color:"black", location:"d8")
	  
	  #return board
	  board
	end
	
	def display_board
	  puts "  A | B | C | D | E | F | G | H |"
	  (1..8).each do |l|
	    print "#{l} "
		('A'..'H').each do |i|
		  x, y = map_loc("#{i}#{l}")
		  if(@board[x][y].nil?)
		    print "- | "
		  else
		    print "#{@board[x][y]} | "
		  end
		end
		puts
	  end
	  puts
	end
  end
end
