def ftoc(temp)
    c = (temp.to_f - 32)* (5.0/9.0)
    return c

end

def ctof(temp)
    f = (9.0/5.0)*temp.to_f + 32
    return f
end
