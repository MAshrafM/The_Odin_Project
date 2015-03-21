def reverser
	reversed = []
	words = yield
	words.split(' ').each do |word|
		reversed << word.reverse
	end
	return reversed.join(' ')
end

def adder(i = 1)
	idx = yield
	return idx + i
end

def repeater(i = 2)
	i.times do
		yield
	end
end