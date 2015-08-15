# lib/MasterMind/game.rb

module MasterMind
  class Game
    attr_reader :player, :name, :deck, :guess, :current_guess
	
	def initialize(player)
	  @player = player
	  @name = player.name
	  @deck = Deck.new(slots: [1,2,3,4])
	  @guess = 14
	  @current_guess = ["","","",""]
	end
	
	def eval_guess(guess = @current_guess)
	  rating = []
	  guess.each_with_index do |s, idx|
	    if @deck.slots.include? s.to_i
		  if @deck.get_slot(idx) == guess[idx]
		    rating << "O"
	      else
		    rating << "_"
		  end
		else
		  rating << "X"
		end
	  end
	  rating.join("")
	end
	
	def solicit_guess
	  "#{@name}: Enter 4 digits bet. 1-5"
	end
	
	def get_guess(current_guess=gets.chomp)
	  @current_guess = current_guess.split("").map{|idx| idx.to_i}
	  @guess -= 1
	end
  
    def win?
	  eval_guess == "OOOO" ? true : false
	end
	
	def lose?
	  @guess == 0 ? true : false
	end
	
	def game_over_msg
	  return "You Won!!!" if win?
	  return "You are out of Guess. You Lost!!!" if lose?
	end
	
	def inst
	  puts "MasterMind"
	  puts "Try to hack the safe enter 4 digits bet 1-5"
	  puts "You have 14 try to get it right"
	  puts "----------------------------------------------"
	end
	
	def guess_count
	  puts "You have #{@guess} guesses left"
	end
	
	def play
	  inst
	  while true
	    puts solicit_guess
		get_guess
		puts eval_guess
		if win? or lose?
		  puts game_over_msg
		  return
		end
		guess_count
	  end
	end

    
  end
end