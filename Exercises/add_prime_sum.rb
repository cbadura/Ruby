# Write a function that takes a positive integer as argument and returns the sum
# of all prime numbers inferior or equal to it followed by a newline.

# If the number of arguments is not 1, or the argument is not a positive number,
# just display 0 followed by a newline.

def is_prime nbr
    # test if there's are rest when dividing nbr by values from 2 to value below nbr
    # since a prime nbr can only be divided by 1 & itself without a rest
    (2..nbr-1).each do |i|
        if (nbr % i) == 0 then
            return false
        end 
    end
    return true
end

def add_prime_sum nbr
    # exception handling
    if nbr < 1 then
        return 0
    end
    
    sum = 0
    # iterate through nbrs from 2 to nbr, test if prime number and add if so
    (2..nbr).each do |i|
        if is_prime(i) then
            sum += i
        end
    end

    return sum
end

puts add_prime_sum(7)