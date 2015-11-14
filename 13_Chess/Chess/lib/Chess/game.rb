# lib/game.rb

module Chess

  class Game
    attr_accessor :current_player, :other_player, :board
	
	def initialize
	  @board = Board.new
	end
	
	def intro
	  puts
	  puts "Wlecome to a Game of Chess"
	  puts
	  puts "Enter name of Player1 White"
	  p1 = gets.chomp.downcase
	  @current_player = Player.new({name: p1, color: "white"})
	  puts "Enter name of Player2 Black"
	  p2 = gets.chomp.downcase
	  @other_player = Player.new({name: p2, color: "black"})
	  puts "Have a good game"
	end
	
	def getMoves
	  puts
	  puts "#{current_player.name.capitalize}, your Turn select a piece"
	  #add save
	  init_loc = gets.chomp.downcase
	  until checkPlace?(init_loc)
	    puts "there is no #{current_player.color} piece here, choose another"
	    init_loc = gets.chomp.downcase
	  end
	  piece = board.get_location(init_loc)
	  puts piece 
	  puts
	  puts "enter target"
	  target_loc = gets.chomp.downcase
	  until check_move?(init_loc, target_loc)
		puts " not a valid target, choose another"
		target_loc = gets.chomp.downcase
	  end
	  castle = true if piece.is_a?(King) && (target_loc == "g1" || target_loc == "g8")
	  move_piece(init_loc, target_loc, castle)
	  
	  
	end
	
	def switchPlayers
	  temp = @current_player
	  @current_player = @other_player
	  @other_player = temp
	end
	
	def checkPlace?(loc)
	  x, y = loc.split('')
	  if x.between?("a","h") && y.to_i.between?(1,8)
	    return popSquare?(loc)
	  else
	    puts "outside the board limit"
	    return false
	  end
	end
	
	def popSquare?(loc)
	  piece = board.get_location(loc)
	  if piece.nil?
	    puts "No piece in this cell"
		return false
	  elsif piece.color != current_player.color
	    puts "Not your piece"
		return false
	  end
	  true
	end
	
	def check_move?(init_loc, target_loc)
	  return true if board.get_location(init_loc).valid_move?(board, target_loc)
	end
	
	def move_piece(init_loc, target_loc, castle = false)
	  totem = board.get_location(init_loc)
	  board.set_location(init_loc, nil)
	  board.set_location(target_loc, totem)
	  puts "#{current_player.name} moved #{totem} from #{init_loc} to #{target_loc}"
	  current_player.moves << [init_loc, target_loc]
	  
	  if castle
	    if totem.color == "white"
		  rook = board.get_location("h1")
		  board.set_location("h1", nil)
		  board.set_location("f1", rook)
		  puts "#{current_player.name} Castled"
		  current_player.moves << ["h1", "f1"]
		else
		  rook = board.get_location("h8")
		  board.set_location("h8", nil)
		  board.set_location("f8", rook)
		  puts "#{current_player.name} Castled"
		  current_player.moves << ["h8", "f8"]
		end
		totem.possible_moves.pop()
	  end
	  if totem.is_a?(Pawn)
	    if totem.promote?
		  puts "Promote Your Pawn"
		  puts "choose Q: for Queen"
		  puts "choose B: for Bishop"
		  puts "choose K: for Knight"
		  puts "choose R: for Rook"
		  new_piece = gets.chomp.upcase
		  
		  case new_piece
		  when 'Q'
		    newP = Queen.new(color: current_player.color, location: target_loc)
		  when 'B'
		    newP = Bishop.new(color: current_player.color, location: target_loc)
		  when 'K'
		    newP = Knight.new(color: current_player.color, location: target_loc)
		  when 'R'
		    newP = Rook.new(color: current_player.color, location: target_loc)
		  end
		  
		  board.set_location(target_loc, newP)
		  puts "#{current_player.name} promoted #{totem} to #{newP}"
		end
	  end
	  
	end
	
	def draw?
	  count = 0
	  board.board.each do |row|
	    row.each do |col|
		  count += 1 if col
		end
	  end
	  
	  if count < 3
	    puts "Draw"
		return true
	  end
	  false
	end
	
	def find_king(player)
	  board.board.each do |row|
	    row.each do |col|
		  if col
			return col if col.is_a?(King) && col.color == player.color
		  end
		end
	  end
	end
	
	def enemy(player)
	  enemy = []
	  board.board.each do |row|
		row.each do |col|
		  if !col.nil? && col.color == player.color
			enemy << col
		  end
		end
	  end
	  enemy
	end
	
	def check?
		king_pos = find_king(current_player)
		enemy_pos = enemy(other_player)
		enemy_pos.each do |enemy|
			if enemy.valid_move?(board, king_pos.loc)
			  puts "Check!!!"
			  return true
			end
		end
		false
	end
	
	def play
	  intro
	  board.display_board
	  loop do
	    getMoves
		board.display_board
		switchPlayers
		break if check? || draw?
		
	  end
	end

  end
end