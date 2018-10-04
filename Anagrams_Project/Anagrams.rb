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

#We are looping once and then using the delete at function, which should be two ns so n^2 for time and

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

def anagram3(string, string2)
(string.chars.sort.join == string2.chars.sort.join) ? true : false
end

def anagram3V2(string, string2)  #just wanted to see if this would work...
new_array = string.chars.sort - string2.chars.sort
new_array.empty? ? true : false
end



# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words.
# Compare the resulting hashes.
# What is the time complexity? We are using hashes so the time complexity will be linear with a constant space

def anagram4(string, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string.each_char do |ch|
    hash1[ch] += 1
  end
  string2.each_char do |ch|
    hash2[ch] += 1
  end

  hash1 == hash2 
end


def anagram4V2(string, string2)
  comprehensive_hash = Hash.new(0)

  string.each_char do |ch|
    comprehensive_hash[ch] += 1
  end

  string2.each_char do |ch|
    comprehensive_hash[ch] -= 1
  end

  comprehensive_hash.values.all? {|num| num == 0}
end
