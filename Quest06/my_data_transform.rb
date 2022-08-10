# You noticed our CSV is composed of 3 columns we cannot group easily: Email - Age - Order At.

# For the email, we will consider the provider.
# For the age column, we consider a group from [1->20] - [21->40] - [41->65] - [66->99]
# For the Order at column, we consider a group for [morning => 06:00am -> 11:59am] - [afternoon => 12:00pm -> 5:59pm] - [evening => 6:00pm -> 11:59pm]

# You will have to create a function which will replace the value in each of this column with the correct actionable data.
# (ex: if the age is between 21 and 40, replace by "21->40")

# Your function will be prototyped: def my_data_transform(csv_content). It will take a string which contains data in CSV format
# and it will return a string in CSV format with the column Email, Age and Order At transformed.

require 'date'

def my_csv_parser(string, separator)
    # split lines
    lines = string.split("\n")
    # p lines
    lines.map! { |s| s.split(",") }
    return lines
end

def transform_age(entry_detail)
    if entry_detail.to_i < 21
        age_group = "1->20"
    elsif entry_detail.to_i > 20 && entry_detail.to_i < 41
        age_group = "21->40"
    elsif entry_detail.to_i > 40 && entry_detail.to_i < 66
        age_group = "41->65"
    else
        age_group = "66->99"
    end
    return age_group
end

def transform_date_time(entry_detail)
    date = DateTime.parse(entry_detail, '%Y-%m-%d %H:%M:%S')
    if date.hour > 5 && date.hour < 12
        time = "morning"
    elsif date.hour > 11 && date.hour < 18
        time = "afternoon"
    elsif date.hour > 17 || date.hour < 5
        time = "evening"
    end
    return time
end

def my_data_transform(csv_string)
    arr = my_csv_parser(csv_string, ",")
    # p arr

    arr.drop(1).each do |entry_arr|   # skip first array, just titles of columns
        entry_arr.each_with_index do |entry_detail, index|
            # take 5th field, cut after @
            if index == 4
                entry_arr[4] = entry_detail.split('@')[1]
            end
            # take 6th field, transform into age group
            if index == 5
                entry_arr[5] = transform_age(entry_detail)
            end
            # take 10th field, transform into time of day
            if index == 9
                entry_arr[9] = transform_date_time(entry_detail)
            end
        end
    end
    # create new string array
    joined_arr = []
    # put back together CSV strings in arr and add to new array
    arr.each do |entry_arr|
        joined = entry_arr.join(",")
        joined_arr.push(joined)
    end
    return joined_arr
end

csv_input = "Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n"

p my_data_transform(csv_input)