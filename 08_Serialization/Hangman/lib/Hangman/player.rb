# lib/Hangman/player.rb

module Hangman
  class Player
    attr_reader :name
    def initialize(input)
	  @name = input.fetch(:name)
	end
	
	def set_name(load)
	  @name = load
	end
	
	def guess
	  (1..10).each do |i|
	    letter = gets.chomp
	    action = letter.upcase
	    if action == "LOAD" || action == "SAVE" || action == "QUIT" || action.match(/^[a-zA-Z]$/)
	      return action
	    else
	      puts "You can enter a letter or an action"
	    end
		
		if i == 9
		  return "QUIT"
		end
	  end
	end
  
  end
end
