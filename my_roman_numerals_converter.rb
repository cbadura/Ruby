# Write a function to convert from normal numbers to Roman Numerals.
# It will return a string with the roman numeral.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M.
# There is no need to be able to convert numbers larger than about 3000.
# In Roman numerals 1990 is MCMXC:
# 1000=M
# 900=CM
# 90=XC

def my_roman_numerals_converter(nbr)    
    numeral = ""
    result = 0
    # calculate 1000s/Ms
    if nbr >= 1000
        # divide by 1000 base value & find remainder
        result = nbr / 1000
        nbr = nbr % 1000
        numeral += "M" * result
    end
    # calculate 500s/Ds & Cs
    if nbr >= 100
        # divide by 100 base value & find remainder
        result = nbr / 100
        nbr = nbr % 100
        # the '9' case
        if result == 9
            numeral += "CM"
            result -= 9
        end
        # the '4' case
        if result == 4
            numeral += "CD"
            result -= 4
        end 
        if result >= 5 && result != 9
            numeral += "D"
            result -= 5
        end
        numeral += "C" * result
    end
    # calculate 50s/Ls & 10s/Ds
    if nbr >= 10
        # divide by 10 base value & find remainder
        result = nbr / 10
        nbr = nbr % 10
        # the '9' case
        if result == 9
            numeral += "XC"
            result -= 9
        end
        # the '4' case
        if result == 4
            numeral += "XL"
            result -= 4
        end 
        if result >= 5
            numeral += "L"
            result -= 5
        end
        numeral += "X" * result
    end
    # calculate 5s/Vs & 1s/Vs
    if nbr > 0
        # the '9' case
        if nbr == 9
            numeral += "IX"
            nbr -= 9
        end
        # the '4' case
        if nbr == 4
            numeral += "IV"
            nbr -= 4
        end
        if nbr >= 5
            numeral += "V"
            nbr -= 5
        end
        numeral += "I" * nbr
    end

    return numeral
end

puts my_roman_numerals_converter(849)