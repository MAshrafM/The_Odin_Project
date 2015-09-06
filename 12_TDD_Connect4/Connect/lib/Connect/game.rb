# lib/game

module Connect
  class Game
    attr_reader :player, :board, :current_player, :other_player
	
	def initialize(player)
	  @player = player
	  @board = Board.new
	  @current_player, @other_player = @player.shuffle
	end
	
	def switch_player
	  @current_player, @other_player = @other_player, @current_player
	end
	
	def inst
	 puts "+-"*16
	 puts "\tWelcome to Connect"
	 puts "\t#{current_player.name} & #{other_player.name}"
	 puts "#{current_player.name} will go first   "
	 puts " Enter a number between 1 and 6 "
	 puts "+-"*16
	end
	
	def solicit_move
	  puts "#{current_player.name} (#{current_player.token}) Your Move"
	end
	
	def game_over_msg
	  if @board.game_over == :winner
	    puts "Congrats!! #{current_player.name} You Won!!!"
	  elsif @board.game_over == :draw
	    puts "Draw!!! thx for playing"
	  end
	end
	
	def play
	  inst
	  while true
	    @board.display_board
		puts
		solicit_move
		loop do
		  col = gets.chomp.to_i
		  break if @board.put_token(col - 1 , current_player.token)
		  puts "Column is full choose another one"
		end
		
		if @board.game_over
		  @board.display_board
		  game_over_msg
		  return
		else
		  switch_player
		end
	  end
	end
	
  end
end
