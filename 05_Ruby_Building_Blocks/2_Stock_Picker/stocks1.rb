def stock_picker(stocks)
	buy = 0
	sell = 0
	profit = 0
	
	stocks.each_with_index do |i, idx|
		stocks.each_with_index do |j, jdx|
			if jdx > idx 
				if (j - i) > profit
					profit = j - i
					buy = idx
					sell = jdx					
				end
			end
		end
	end
	if profit != 0
		puts "buy on #{buy} $#{stocks[buy]} and sell on #{sell} $#{stocks[sell]}"
	else
		puts "bad week"
	end
end

stock_picker([17,3,6,9,15,8,10])
stock_picker([3,6,9,15,1,10,17])
stock_picker([3,6,8,6,10,1,17])
stock_picker([17,1])