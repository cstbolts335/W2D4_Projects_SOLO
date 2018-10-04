  # Phase 1: my_min
  # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  #First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
  #What is the time complexity for this function?

  # 
  def check_list(array)
    min = array.first
    array.each do |num|
      min = num if num < min
    end
    min
  end
