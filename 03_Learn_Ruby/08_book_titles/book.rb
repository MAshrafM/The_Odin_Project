class Book	
	attr_accessor :title
	
	def initialize
		title = @title
	end
	
	def title=(str)
		no_list = ['a', 'an', 'in', 'of', 'the', 'and', 'but', 'or', 'yet', 'for', 'nor', 'so']
		new = []
		words = str.split(' ')
		words.each_with_index do |word, i|
			if(i == 0)
				new << word.capitalize
			elsif no_list.include?(word)
				new << word
			else
				new << word.capitalize
			end
		end
		@title = new.join(' ')
	end
end