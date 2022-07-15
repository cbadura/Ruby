def my_string_index(haystack, needle)
    result = haystack.index(needle)
    if (result == nil)
        return -1
    else
        return result
    end
end

puts my_string_index("hello", 'a')