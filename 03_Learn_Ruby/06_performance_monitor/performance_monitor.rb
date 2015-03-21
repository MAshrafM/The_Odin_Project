def measure(i=1)
	start = Time.now
	i.times do
		yield
	end
	end_t = Time.now
	total = end_t - start
	average = total/ i
end