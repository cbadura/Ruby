# Your mission here is to transform a string following the CSV format to a 2d array.
# Your function will takes two arguments, the content of a CSV as a string and a separator.
# Your function will return an array (lines) of arrays (columns).
# In this assignement, you will have to solve a problem: how to transform a string into an array of array.

# When you’re looking for things like (normally invisible) newline characters,
# or you want to make sure some value is correct, then you use p.

def my_csv_parser string, separator
    # split lines
    lines = string.split("\n")
    # p lines
    lines.map! { |s| s.split(",") }
    return lines
end

string = "a,b,c,e\n1,2,3,4\n"
separator = ","

p my_csv_parser(string, separator)

