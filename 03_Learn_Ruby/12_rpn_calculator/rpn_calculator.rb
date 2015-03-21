class RPNCalculator
	attr_accessor :stack
	
	def initialize
		@stack = [0]
	end

	def value
		@stack.last
	end
	
	def push(n)
		@stack.push(n)
	end
	
	def pop
		i = @stack.pop
		raise 'calculator is empty' if i.nil?
		return i
	end
	
	def plus
		sum = pop + pop
		@stack.push(sum)
	end
	
	def minus
		i = pop
		dif = pop - i
		@stack.push(dif)
	end
	
	def times
		mul = pop * pop
		@stack.push(mul)
	end
	
	def divide
		i = pop.to_f
		div = pop.to_f / i
		@stack.push(div)
	end
	
	def tokens (str)
	t = ['+', '-', '*', '/']
		str.split.map do |i|
			if t.include?(i)
				i.to_sym
			else
				i.to_f
			end
		end
	end
	
	def evaluate (str)
		tokens(str).each do |j|
			if j == :+
				plus
			elsif j == :-
				minus
			elsif j == :*
				times
			elsif j == :/
				divide
			else
				push(j)
			end
		end
		value
	end
end