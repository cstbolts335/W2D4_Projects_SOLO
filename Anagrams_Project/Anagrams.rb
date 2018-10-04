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
