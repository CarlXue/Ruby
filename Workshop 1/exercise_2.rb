class Exercise_2

  # function 1
  def odd_even_array(array)
    #define two counters
    even_count = 0
    odd_count = 0
    #iterate the array to count the quantities of even and odd number
    array.each do |num|
      if num.is_a? Fixnum
        (num % 2 == 0) ? even_count += 1 : odd_count += 1
      end
    end
    #compare the counter and return the value
    if even_count > odd_count
      return :even
    elsif even_count < odd_count
      return :odd
    else
      return :equal
    end
  end


  # function 2
  def average(array)
    #initial the sum 
    sum = 0
    #assume that all the elements are numeric
    array.each { |num| sum += num }
    sum.fdiv(array.count)
  end
  
  # function 3
  def sum_binary(array)
    #initial the sum
    sum = 0
    #iterate the array to calculate the sum and count the
    array.each do |num|
      if num.is_a? Fixnum
        sum += num
      end
    end
    sum.to_s(2)
  end
  
  # function 4
  def flatten_array(array_group)
    #define a new flatten array
    new_array = Array.new()
    #traverse all the item in the array group
    array_group.each do |row|
      row.each { |item| new_array << item }
    end
    new_array
  end

end