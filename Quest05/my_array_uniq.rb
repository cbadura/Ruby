def my_array_uniq(array)
    array = array.uniq
    return array
end

numbers = [1, 1, 1, 2, 3, 4, 1]
puts my_array_uniq(numbers)