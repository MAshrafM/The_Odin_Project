def translate(str)
	words = str.split(" ")
	returned = []
	words.each do |word|
		if word[/^[aeiou]/]
			word += 'ay'
		else
			if word[/^[qu]/]
				word.slice!(/^qu/)
				word += 'quay'
			else
				word += word.slice!(0...(word.index(/[aeioqu]/,1)))
				if word[/^[qu]/]
					word.slice!(/^qu/)
					word += 'quay'
				else
					word += 'ay'
				end
			end
		end
		returned << word
	end
	
	return returned.join(" ")
end
