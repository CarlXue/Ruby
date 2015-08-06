class Exercise_2

  # function 1
  def odd_even_array(array)
    #define two counters
    even_count = 0
    odd_count = 0
    #iterate the array to count the quantities of even and odd number
    for num in array
      if num % 2 ==0
        even_count += 1
      else
        odd_count += 1
      end
    end
    #compare the counter and return the value
    if even_count > odd_count
      return :odd
    elsif even_count < odd_count
      return :even
    else
      return :equal
    end
  end


  # function 2
  def average(array)
    #initial the sum 
    sum = 0
    #iterate the array to calculate the sum and count the
    for num in array
      sum += num
    end
    
    return sum.fdiv(array.count)
  end
  
  # function 3
  def sum_binary(array)
    #initial the sum
    sum = 0
    #iterate the array to calculate the sum and count the
    for num in array
      sum += num
    end

    return sum.to_s(2)
  end
  
  # function 4
  def flatten_array(array_group)
    #define a new flatten array
    new_array = Array.new()
    #traverse all the item in the array group
    for row in array_group
      for item in row
        new_array.push(item)
      end
    end

    return new_array
  end

  #extension question
  
end