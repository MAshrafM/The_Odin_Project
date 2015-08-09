def Substrings(key, dictionary)
	outHash = {}
	dictionary.each do |sub|
		num = key.scan(/#{sub}/i).size
		outHash[sub] = num if num > 0
	end
	puts outHash

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

Substrings("below", dictionary)
Substrings("Howdy partner, sit down! How's it going?", dictionary)