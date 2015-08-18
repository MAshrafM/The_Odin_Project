# lib/Hangman/word.rb

module Hangman
  class Word
    attr_reader :word, :result, :wrong
	
	def initialize
	  @word = random_word
	  @wrong = []
	  @result = "_" * @word.size
	end
	
	def set_word(load)
	  @word = load
	  @result = "_" * @word.size
	end
	
	def set_result(load)
	  @result = load
	end
	
	def set_wrong(load)
	  @wrong = []
	  load.each{|i| @wrong << i}
	end
	
	def action(char)
	  if @word.include?(char)
	    add_result(char)
	  else 
	    add_wrong(char)
	  end
	end
	
	def display
	  puts "Word:\t #{@result.split("").join(" ")}"
	  puts "Wrong:\t #{@wrong.sort.join(" | ")}"
	end
	
	def win?
	  @result == @word
	end
	
	def add_result(char)
	  @word.split('').each_with_index{|c, idx| result[idx] = char if c == char}
	end
	
	def add_wrong(char)
	  @wrong << char
	end
	
	def random_word
	  dict = File.read("./lib/5desk.txt").split
	  dict.select{|w| w.size.between?(5,12)}.sample.upcase
	end
  end
end
