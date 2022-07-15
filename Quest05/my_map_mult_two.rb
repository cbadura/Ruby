def my_map_mult_two(array)
    array.map! {|item| item * 2} # "!" to modify the array in place (otherwise another array must be assigned with expression)
    return array
end

array = [1, 2, 3, 4, 5]
puts my_map_mult_two(array)