def stock_picker(stocks)
	buy = 0
	sell = 0
	profit = 0
	
	stocks.each do |i|
		stocks.each do |j|
			if stocks.index(j) > stocks.index(i) 
				if (j - i) > profit
					profit = j - i
					buy = stocks.index(i)
					sell = stocks.index(j)					
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