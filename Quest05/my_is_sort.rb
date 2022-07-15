def my_is_sort(array)
    if is_ascending(array) || is_descending(array)
        return true
    else
        return false
    end
end

def is_ascending(array)
    sorted = true
    array.each_cons(2) do |first, second|
        if first > second
            sorted = false
        end
    end
    return sorted
end

def is_descending(array)
    sorted = true
    array.each_cons(2) do |first, second|
        if first < second
            sorted = false
        end
    end
    return sorted
end

array = [4, 2, 3]
# puts my_is_sort(array)
puts my_is_sort(array)



