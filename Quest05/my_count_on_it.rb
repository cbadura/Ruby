def my_count_on_it(array)
    lengths = []

    array.each do |string|
        lengths.push string.length
    end
    
    return lengths
end

array = ["This", "is", "the", "way"]
puts my_count_on_it(array)