def fibs(n)
  return 0 if n == 0
  return 1 if n == 1
  a = 0
  b = 1
  #result = [a, b]
  (n-1).times do
    temp = b
	b = b + a
	#result << b
	a = temp
  end
  b
  #result
end

def fibs_rec(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs_rec(n-1) + fibs_rec(n-2)
end

puts fibs(10).to_s # => 55
puts fibs_rec(10) # => 55
