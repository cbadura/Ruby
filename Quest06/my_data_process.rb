# Our function will group the data and it will become a Hash of hash. (Wow.)
# Example:
# "{'Gender': {'Male': 22, 'Female': 21}, 'Email': {'yahoo.com': 3, 'hotmail.com': 2}, ...}"

# We will discard the column FirstName, LastName, UserName and Coffee Quantity from our output.

# Your function will be prototyped: def my_data_process
# It will take a string array which is the output of your function my_data_transform, it will return a json string of hash of hash following this format:
# {COLUMN: {Value1: nbr_of_occurence_of_value_1, Value2: nbr_of_occurence_of_value_2, ...}, ...}
# Order of Column will be the order they are in the header of the CSV (Gender first then Email, etc)
# Order of the Value will be the order they appear in each line from top left.
###

require 'json'

# for deleting certain columns in outer hash
def remove str, &block
    str.split(',').select(&block).join(',')
end

def my_data_process array
    # string arr that holds key strings, fill with empty strings
    val_arr = Array.new(10)
    for i in 0 .. val_arr.length
        val_arr[i] = ""
    end

    # create strings of lists for all inner keys, store in array
    array.drop(1).each do |entry_arr|   # skip first array, just titles of columns
        # split lines
        entry_arr = entry_arr.split(",")
        # fill val_arr
        entry_arr.each_with_index do |entry_detail, index|
            # build value string, skip unnecessary columns
            if index == 0 || index == 4 || index == 5 || index == 6 || index == 7 || index == 9
                val_arr[index] << entry_detail
                val_arr[index] << ","
            end
        end
    end

    # delete empty arr elements & last comma of each string
    val_arr.reject! { |c| c.empty? }
    # val_arr.each { |string| string.chop! }
    # p val_arr
    val_str_arr = val_arr.join.split(",")
    # p val_str_arr

    # create new array with only unique keys on each string
    uniq_val_arr = []
    val_arr.each do |string|
        string_arr = string.split(",")
        uniq_val_arr << string_arr.uniq
    end
    uniq_concat_arr = uniq_val_arr.flatten
    # p uniq_concat_arr

    # create inner hashes with inner level of keys & count values for each field
    arr_of_hashes = []
    uniq_concat_arr.each { |key| arr_of_hashes << { key => val_str_arr.count(key) } }
    # p arr_of_hashes
    # group hashes for outer hash
    gender = arr_of_hashes[0].merge(arr_of_hashes[1])
    provider = arr_of_hashes[2].merge(arr_of_hashes[3])
    age = arr_of_hashes[4].merge(arr_of_hashes[5], arr_of_hashes[6])
    city = arr_of_hashes[7].merge(arr_of_hashes[8], arr_of_hashes[9], arr_of_hashes[10])
    browser = arr_of_hashes[11].merge(arr_of_hashes[12], arr_of_hashes[13])
    time = arr_of_hashes[14].merge(arr_of_hashes[15])
    
    # create outer hash
    # delete certain columns
    keys = remove(array[0]) {|elm| elm != "FirstName"}
    keys = remove(keys) {|elm| elm != "LastName"}
    keys = remove(keys) {|elm| elm != "UserName"}
    keys = remove(keys) {|elm| elm != "Coffee Quantity"}
    # transform into array
    key_arr = keys.split(',')

    # create basic JSON from key_arr & insert inner level
    outer_hash = {}
    outer_hash[key_arr[0]] = gender
    outer_hash[key_arr[1]] = provider
    outer_hash[key_arr[2]] = age
    outer_hash[key_arr[3]] = city
    outer_hash[key_arr[4]] = browser
    outer_hash[key_arr[5]] = time
   
    # puts outer_hash
    return JSON[outer_hash]
end


# array = [[:a, 1], [:b, 2], [:c, 3]]

# # convert array to hash
# hash = Hash[array]
# puts hash

input = ["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"]

puts my_data_process(input)