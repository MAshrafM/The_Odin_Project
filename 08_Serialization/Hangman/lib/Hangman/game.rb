# lib/Hangman/game.rb
require 'yaml'

module Hangman
  class Game
    attr_reader :name, :word, :wcount
	def initialize(player)
	  @player = player
	  @name = player.name
	  @word = Word.new
	  @wcount = 12
	end
	
	def solicit_move
	  puts "#{name} : You can enter a letter or an action"
	end
	
	def show_hang
	  puts "Hangman:\t" + "X"*(12 - @wcount) + "."*@wcount
	end
	
	def save_game
      save = {}
	  save[:word] = @word.word
	  save[:name] = name
	  save[:guess] = @word.result
	  save[:wrong] = @word.wrong
	  save[:wcount] = wcount
	  
	  File.open("./lib/save_file.txt", "w") do |out|
	    YAML.dump(save,out)
	  end
	end
	
	def load_game
	  save = YAML.load_file("./lib/save_file.txt")
	  @word.set_word(save[:word])
	  @word.set_result(save[:guess])
	  @word.set_wrong(save[:wrong])
	  @name = save[:name]
	  @wcount = save[:wcount]
	end
	
	def inst
	   puts "**************************************************"
	   puts
	   puts "                Welcome to Hangman                "
	   puts 
	   puts "**************************************************"
	   puts "Try to guess the word in 12 tries"
	   puts "Enter a character every turn"
	   puts "or you can enter one of three actions"
	   puts "load, save , quit "
	end
	
	def play
	  inst
	  while true
		@word.display
		show_hang
		solicit_move
		letter = @player.guess
		if letter == "LOAD"
		  if File.exist?("./lib/save_file.txt")
		    load_game
			puts "*****Game Loaded*******"
		  else
		    puts "******No File to Load********"
		  end
		elsif letter == "SAVE"
		  save_game
		  puts "*******Game Saved********"
		elsif letter == "QUIT"
		  puts "Exit game sure (y/n)?"
		  cc = gets.chomp
		  if cc.upcase == "Y"
		    puts "Thanks for playing :)"
			break
		  end
		else 
		  @word.action(letter)
		  if @word.win?
		    puts "#{name} : You Won!!!"
			return
		  else
		    @wcount -= 1
			if(@wcount == 0)
			  puts "Hang him HIGH!!! ... YOU LOST!!!"
			  return
			end
		  end
		  
		end
	  end
	end
  
  end

end
