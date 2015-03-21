class Integer
	def in_words
		num = self
		
		words = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 
		  7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 
		  13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 
		  18 => "eighteen", 19=>"nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 
		  50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety" }
		order = [
				  [100, "hundred"],
				  [1000, "thousand"],
				  [1_000_000, "million"],
				  [1_000_000_000, "billion"],
				  [1_000_000_000_000, "trillion"],
				  [1_000_000_000_000_000]
				] 
		if words.has_key?(num)
			return words[num]
		end
		
		if num < 100
			tens = (num / 10) * 10
			units = num % 10
			return tens.in_words + ' ' + units.in_words
		end
		
		order.each_index do |key|
			if num % order[key][0] == 0 and num < order[key+1][0]
				return (num/order[key][0]).in_words + ' ' + order[key][1]
			elsif num < order[key+1][0]
				return (num/order[key][0]).in_words + ' ' + order[key][1] + ' ' + (num%order[key][0]).in_words
			end
		end
	end

end