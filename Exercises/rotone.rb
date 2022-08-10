# Write a program that takes a string, will perform a transformation and return it.
# For each of the letters of the parameter string switch it by the next one in alphabetical order.
# 'z' becomes 'a' and 'Z' becomes 'A'. Case remains unaffected.

def rotone string
    result = ""
    string.each_byte do |c|
        # puts c.ord
        if c.ord == 122 then
            c = 'a'
        elsif c.ord == 90 then
            c = 'A'
        elsif c.ord != 32 && c.ord != 44 && c.ord > 64 then
            c = c.ord.next.chr
        end
        result << c
    end
    return result
end

puts rotone("AkjhZ zLKIJz , 23y ")