module Enumerable
    def my_each
        for i in self
			yield(i) if block_given?
		end
    end
	
	def my_each_with_index
		for i in (0..self.size-1)
			yield(self[i], i) if block_given?
		end
	end
	
	def my_select
		rt = []
		self.my_each{|i| rt << i if yield(i)}
		rt
	end
	
	def my_all?
		if block_given?
			self.my_each {|i| return false if yield(i)}
		else
			false
		end
		true
	end
	
	def my_any?
		res = false
		if block_given?
			self.my_each {|i| res = true if yield(i)}
		else
			res = true
		end
		res
	end
	
	def my_none?
		if block_given?
			self.my_each{|i| return true if yield(i)}
		else
			true
		end
		false
	end
	
	def my_count
		count = 0
		if block_given?
			self.my_each{|i| count+=1 if yield(i)}
		else
			count = self.size
		end
		count
	end
	
	def my_map(proc = nil)
		res = []
		if proc
			self.my_each{|i| res << proc.call(i)}
		else
			self.my_each{|i| res << yield(i)}
		end
		res
	end
	
	def my_inject(init = nil)
		res = init ? init : self.shift
		if block_given?
			self.my_each{|i| res = yield(res, i)}
		else
			return self
		end
		res
	end
end


def multiply_els(col)
	col.my_inject{|res, i| res*i}
end

puts "mul:\t" + multiply_els([2,4,5]).inspect
test = Proc.new{|z| z ** 2}
puts "map:\t" + [1,2,3,4,5,6,7].map{|i| i**2}.inspect
puts "mymap:\t" +[1,2,3,4,5,6,7].my_map(test).inspect