def add(a,b)
    return a + b
end

def subtract(a,b)
    return a - b
end

def sum(nums)
    sums = 0
    nums.each do |i|
        sums += i
    end
    return sums
end

def multiply(*nums)
    return nums.inject(1){|sum, num| sum * num}
end

def power(a,b)
    return a**b
end

def factorial(a)
    if a < 1 
        return 1
    else
        n = a * factorial(a-1)
        return n
    end
end
