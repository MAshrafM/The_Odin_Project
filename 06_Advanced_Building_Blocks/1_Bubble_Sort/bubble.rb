def bubble_sort (col)
	sorted = false
	len = col.size - 1
	until sorted
		sorted = true
		len.times do |i|
			if col[i] > col[i+1]
				col[i], col[i+1] = col[i+1], col[i]
				sorted = false
			end
		end
	end
	col
end

def bubble_sort_by (col)
	sorted = false
	len = col.size - 1
	until sorted
		sorted = true
		len.times do |i|
			if yield(col[i],col[i+1]) > 0
				col[i], col[i+1] = col[i+1], col[i]
				sorted = false
			end
		end	
	end
	col
end


print bubble_sort([4,3,78,2,0,2]).inspect
puts
print bubble_sort([4,2,5,3,7,1,6,10,9,8]).inspect
puts

x = bubble_sort_by(["hello", "hi", "hey"]) do |left, right|
	left.length - right.length
end

print x.inspect
puts
y = bubble_sort_by(["hello", "hi", "hey"]) do |left,right|
    right.length - left.length
end
print y.inspect
puts