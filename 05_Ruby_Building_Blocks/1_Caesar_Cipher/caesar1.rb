class Caesar
	attr_accessor :text, :key, :encrypt
	
	def initialize
		puts "Enter Text to Encrypt: "
		txt = gets.chomp
		@text = txt.to_s
		
		until @key.to_i != 0
			puts "Enter Integer key: "
			ky = gets.chomp
			@key = ky.to_i
		end

		@encrypt = []
		outPut
	end
	
	
	def encryption
		@text.chars.map do |ch|
			if !ch.ord.between?(65,90) && !ch.ord.between?(97,122) 
				@encrypt << ch
			elsif ch == ch.upcase 
				@encrypt << ((ch.ord - 65 + @key)%26 + 65).chr
			else 
				@encrypt << ((ch.ord - 97 + @key)%26 + 97).chr
			end
		end
	end

	
	def outPut
		encryption
		puts "output is #{@encrypt.join('')}"
	end

end

Cipher = Caesar.new()