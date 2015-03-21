class Temperature
	def initialize(options)
		@temp = options
	end
	
	def in_fahrenheit
		@temp[:f] ? @temp[:f] : ((9.0/5.0) * in_celsius + 32)
	end
	
	def in_celsius
		@temp[:c] ? @temp[:c] : (in_fahrenheit - 32 ) * ( 5.0 / 9.0)
	end
	
	def self.from_celsius(t)
		self.new(:c => t)
	end

	def self.from_fahrenheit(t)
		self.new(:f => t)
	end
end

class Celsius < Temperature
	def initialize(t)
		@temp = {:c => t}
	end
end

class Fahrenheit < Temperature
	def initialize(t)
		@temp = {:f => t}
	end
end