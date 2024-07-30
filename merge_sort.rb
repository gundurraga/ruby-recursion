def merge(left, right)
  result = []
  left_index = 0
  right_index = 0

  while left_index < left.length && right_index < right.length
    if left[left_index] <= right[right_index]
      result << left[left_index]
      left_index += 1
    else
      result << right[right_index]
      right_index += 1
    end
  end
  result += left[left_index..] if left_index < left.length
  result += right[right_index..] if right_index < right.length
  result
end

def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2

  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..])

  merge(left, right)
end

# Test the implementation
test_array = [3, 2, 1, 13, 8, 5, 0, 1, 99, 102, 99_282, 2, -2, 9329, 2181, -1821]
sorted_array = merge_sort(test_array)
puts "Sorted array: #{sorted_array}"
