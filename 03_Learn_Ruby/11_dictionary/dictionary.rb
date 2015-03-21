class Dictionary
	def initialize
		@dict = {}
	end
	
	def entries
		@dict
	end
	
	def add (new)
		if new.is_a?(Hash)
			new.each {|key, value| @dict[key] = value}
		else
			@dict[new] = nil
		end
	end
	
	def keywords
		@dict.keys.sort
	end
	
	def include?(word)
		entries.keys.include?(word)
	end
	
	def find(chars)
		back = {}
		entries.each do |key, value|
			if key =~ /^#{chars}/
				back[key] = value
			end
		end
		back
	end
	
	def printable
		keywords.map {|key| "[#{key}] \"#{entries[key]}\""}.join("\n")
	end

end