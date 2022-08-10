# Write a program that takes a string as a parameter, and returns its words in
# reverse order.

# A word is a section of string delimited by spaces/tabs or the start/end of the
# string. If a word has a single letter, it must be capitalized.

# A letter is a character in the set [a-zA-Z]

def rev_wstr string
    # declare empty string and create array from splitting the input at spaces
    rev = ""
    words = string.split(" ")
    # build rev string by iterating through array from the end
    words.reverse_each do |word|
        rev << word
        rev << " "
    end
    # delete space at the end
    rev = rev.chop
    return rev
end

puts rev_wstr("You hate people! But I love gatherings. Isn't it ironic?")