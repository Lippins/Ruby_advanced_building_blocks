def bubble_sort(array)
    i = 1
    while i < array.length
      j = 0
      swapped = false
      while j < (array.length - i)
        if (array[j] > array[j+1])
          array[j], array[j+1] = array[j+1], array[j]
          swapped = true
        end
        j+=1
      end
      break unless swapped == true
      i = i + 1
    end
    array
end