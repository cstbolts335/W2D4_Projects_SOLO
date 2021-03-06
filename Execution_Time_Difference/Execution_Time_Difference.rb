  # Phase 1: my_min
  # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  #First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
  #What is the time complexity for this function? The time complexity should be an O(n^2)... even at worst case. This is a very time complex problem.
  #note to self --> since it's a double while loop, it's n^2. Basically iterating through the input twice. So if you double the input, you n^2 output time 

  #
  def check_list(array)
    min = array.first
    i = 0
    while i < array.length
      j = i + 1
      while j < array.length
        min = array[i] if array[i] < array[j] && array[i] < min
        j += 1
      end
      i += 1
    end
    min
  end

  #Phase II: my_min
  #Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
  #list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  def check_list_linear(array)
    min = array.first
    array.each do |num|
      min = num if num < min
    end
    min
  end


#Largest Contiguous Sub-sum
#You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

#Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.
#Discuss the time complexity of this solution.

# list = [5, 3, -7] --> should equal 8
 # list = [2, 3, -6, 7, -6, 7] -- > should equal 8
 # list = [-5, -1, -3] --> should just be -1

def largest_sub_sum(array) #technically I believe this is a n^3 operation since you are first doing a n^2 with the nested loop and then multiplying by n at the end (the map/ another loop) -- hence the n^3
  answer_subs = []

  (0...array.length).each do |i|
    ((i + 1)...array.length).each do |j|
      answer_subs << [array[i]]
      answer_subs << [array[j]]
      answer_subs << array[i..j]  #should have every combo in subs now
    end
  end
  answer_subs.sort.uniq.map{|sub| sub.reduce(:+)}.max
  # .map {|sub| sub.reduce(:+)}.max # should 1) reduce(:+)/ add up every element in each array. The map returns the array and then max returns the max number
end


#PHASE 2 - O(n) time with O(1) memory --- not sure why but really struggled with this so had to get a hint from the solution



  def largest_sub_sum_linear(arr)
    largest = arr.first
    current = arr.first

    return arr.max if arr.all? { |num| num < 0 }
    i = 1

    while i < arr.length
      current = 0 if current < 0
      current += arr[i]
      largest = current if current > largest
      i+=1
    end

    largest
  end
