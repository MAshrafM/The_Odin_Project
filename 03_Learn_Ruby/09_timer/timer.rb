class Timer
	attr_accessor :seconds
	def initialize
		@seconds = 0
	end
	
	def time_string
		hour = @seconds/3600
		minutes = @seconds%3600
		minute = minutes/60
		second = minutes%60
		sprintf("%02d:%02d:%02d", hour, minute, second)
	end
end