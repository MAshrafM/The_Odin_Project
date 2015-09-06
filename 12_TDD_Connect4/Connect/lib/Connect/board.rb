# lib/board

module Connect

  class Board
    attr_accessor :board
	
	def initialize
	  @board = Array.new(7){ Array.new(6)}  
	end
	
	def put_token(col, token)
	  return false if @board[col].compact.size == 6
	  @board[col].compact! << token
	  (6 - @board[col].size).times {@board[col] << nil}
	end
	
	def game_over
	  return :winner if win?
	  return :draw if draw?
	  false
	end
	
	def draw?
	  @board.all? {|col| col.compact.size == 6}
	end
	
	def win?
	  check_horizon || check_vert || check_diagonal
	end
	
	def check_horizon
	  (0..5).each do |row|
	    num = 0
		val = 0
		(0..6).each do |cell|
		  if @board[cell][row] == val && val != nil
		    num += 1
			return true if num > 3
		  else
		    val = @board[cell][row]
			num = 1
		  end
		end
	  end
	  false
	end
	
	def check_vert
	  @board.each do |col|
	    num = 0
		val = 0
		col.each do |cell|
		  if cell == val && val != nil
		    num += 1
			return true if num > 3
		  else
		    val = cell
			num = 1
		  end
		end
	  end
	  false
	end
	
	def check_diagonal
	  (0..3).each do |idx|
	    (0..2).each do |jdx|
		  num = 0
		  @board[idx][jdx].nil? ? next : num = 1
		  val = @board[idx][jdx]
		  (1..3).each do |cell|
		    num += 1 if val == @board[idx+cell][jdx+cell]
		  end
		  return true if num > 3
		end
	  end
	  
	  (3..6).each do |idx|
	    (0..2).each do |jdx|
		  num = 0
		  @board[idx][jdx].nil? ? next : num = 1
		  val = @board[idx][jdx]
		  (1..3).each do |cell|
		    num += 1 if val == @board[idx-cell][jdx+cell]
		  end
		  return true if num > 3
		end
	  end
	  false
	end
	
	def display_board
	  puts
	  puts " 1 | 2 | 3 | 4 | 5 | 6 "
	  puts "------------------------"
	  puts
	  (0..5).each do |j|
		(0..6).each do |i|		
		  cell = board[i][5-j]
		  print " #{cell.nil? ? '_' : cell} |"
		end
		puts
		puts " - - - - - - - - - - - - "
	  end
	  puts "_____________________________"
	end
	
  end
end
