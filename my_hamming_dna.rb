# 'Hamming distance':
# It is found by comparing two DNA strands and counting how many of the
# nucleotides are different from their equivalent in the other string.
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# Your function will return an integer.
# Given 2 strings with the exact number of characters, count how many characters are different
# at the same position. if they don't share the exact number of characters, return -1.
# if the two arguments are not the same size, you will return -1

def my_hamming_dna(str_one, str_two)
    distance = 0
    
    # compare length of both strings
    if str_one.length != str_two.length
        return -1
    end

    # compare strings and increment distance val if mismatch is found
    i = 0
    while i < str_one.length do
        if str_one[i] != str_two[i]
            distance += 1
        end
        i += 1
    end

    return distance
end

puts my_hamming_dna("ACCAGGG", "ACTATGG")