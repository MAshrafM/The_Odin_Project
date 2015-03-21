def echo(str)
    "#{str}"
end

def shout(str)
    "#{str.upcase}"
end

def repeat(str, i=2)
    re = []
    i.times do
     re << str
    end
    return re.join(' ')
end

def start_of_word(str, i)
    "#{str[0..(i-1)]}"
end

def first_word(str)
    words = str.split()
    return words[0]
end

#stack over flow
def titleize(str)
    str.capitalize!  # capitalize the first word in case it is part of the no words array
    words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
    phrase = str.split(" ").map {|word| 
        if words_no_cap.include?(word) 
            word
        else
            word.capitalize
        end
    }.join(" ") # I replaced the "end" in "end.join(" ") with "}" because it wasn't working in Ruby 2.1.1
  phrase  # returns the phrase with all the excluded words
end
    
