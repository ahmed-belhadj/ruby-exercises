# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
    str.each_char {|char| str.delete!(char) if char == char.downcase}
    return str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
    middle = str.length / 2
    if str.length.odd?
        return str[middle]
    else
        return str[middle-1..middle]
    end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
    result = 0
    str.each_char {|char| result += 1 if VOWELS.include?(char.downcase)}
    return result
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
    result = 1
    (1..num).each {|i| result *= i}
    return result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
    result = ""
    arr.each_index {|i| result += arr[i]
        result += separator unless i == arr.length - 1}
    return result
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
    result = ""
    str.chars.each_index {|i| 
        if i.odd?
            result += str.chars[i].upcase
        else
            result += str.chars[i].downcase
        end}
    return result
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
    result = []
    str.split.each {|word|
        if word.length >= 5
            word = word.reverse
        end
        result << word}
    return result.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
    result = []
    (1..n).each {|int|
        if int % 3 == 0 && int % 5 == 0
            result << "fizzbuzz"
        elsif int % 3 == 0
            result << "fizz"
        elsif int % 5 == 0
            result << "buzz"
        else
            result << int
        end}
    return result
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
    return arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
require 'prime'
def prime?(num)
    return num.prime?
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
    return (1..num).select {|i| num % i == 0}
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
    return factors(num).select {|i| i.prime?}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
    return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
    evens = []
    odds = []

    arr.each {|int|
        if int.even?
            evens << int
        else
            odds << int
        end}

    if evens.length > 1 && odds.length == 1
        return odds[0]
    elsif odds.length > 1 && evens.length == 1
        return evens[0]
    end    
end
