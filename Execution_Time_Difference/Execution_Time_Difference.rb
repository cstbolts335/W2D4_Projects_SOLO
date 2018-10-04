  # Phase 1: my_min
  # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  #First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
  #What is the time complexity for this function? The time complexity should be an O(n^2)... even at worst case. This is a very time complex problem

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

  #Phase II
  #Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
  #list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  def check_list_linear(array)
    min = array.first
    array.each do |num|
      min = num if num < min
    end
    min
  end
