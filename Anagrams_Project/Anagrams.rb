require 'byebug'

# Phase I: Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.
#since this is a permutation... does this mean its a factorial? n!

def anagram?(string, string2)
  str_arr = string.chars
  answer_array = []
  (0...str_arr.length).each do |i|
    answer_array << str_arr.permutation(i).to_a
  end

  answer = answer_array.uniq.join
  answer.include?(string2)
end


# Phase II
# Write a method #second_anagram? that iterates over the first string
# For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index.
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.
# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# STILL WORKING ON THIS...
def second_anagram?(string, string2)
  array = string.split('')
  check_array = string.split('')

  array.each do |ch|
    if check_array.find_index(ch)
      target = check_array.find_index(ch)
    else
      return false
      next
    end
    check_array.delete_at(target)
  end

  check_array.empty?
end


#Phase III
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically.
# The strings are then anagrams if and only if the sorted versions are the identical.
# What is the time complexity of this solution? Is it better or worse than #second_anagram??

  #would this be similar to quicksort? in that it's a (n log(n)) for time and space? 

def anagram3(string1, string2)
(string1.chars.sort.join == string2.chars.sort.join) ? true : false
end
