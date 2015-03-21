class Array
	def sum
		sums = 0
		self.each do |i|
			sums += i
		end
		sums
	end
	
	def square
		self.map{|i| i*i}
	end
	
	def square!
		self.map!{|i| i*i}
	end
end