# Write a function called count_letter that takes a string and returns the number
# of occurences of its alphabetical characters. Other characters are not counted.
# The order is the order of occurence in the string.

def count_letter string
    # convert string
    string.downcase!

    # declare arrays
    arr = string.split("")
    char_arr = []

    # put all letters into array and delete duplicates
    arr.each do |char|
        if char.ord > 96 && char.ord < 123 then
            char_arr.push(char)
        end 
    end
    char_arr.uniq!

    # fill another array with occurrences of these letters
    count_arr = Array.new(char_arr.length)
    char_arr.each do |i|
        count_arr.push(string.count(i)) 
    end
    count_arr.compact!

    # put both arrays together as strings
    count_str_arr = []
    count_arr.each_with_index do |i, index|
        count_str_arr.push(count_arr[index].to_s)
        count_str_arr[index] << char_arr[index]
    end
    
    return count_str_arr.join(", ")
end

puts count_letter("My Hyze 47y 7.")