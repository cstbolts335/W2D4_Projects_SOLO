def two_sum?(arr, target_sum)
  i = 0
      while i < arr.length
        j = i + 1
        while j < arr.length
          if arr[i] + arr[j] == target_sum
            return true
          end
        j += 1
      end
      i += 1
    end
return false
end

# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false
