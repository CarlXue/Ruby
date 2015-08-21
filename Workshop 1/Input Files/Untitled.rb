def flatten_array(array_group)
	#define a new flatten array
	new_array = Array.new()
	#traverse all the item in the array group
	array_group.each do |row|
	    if row.is_a? Array
	#puts true
	      flatten_array(row)
	    else
	#puts false
	      new_array.push(row)
	    end
	end
	puts new_array
end

#def flatten_array(arry)
#  result = Array.new
#  arry.each do |i|
#	if i.is_a?Array
#	  flatten_array(i)
#	else
#	  result.push(i)
#	end
#  end
#  puts result
#end
puts flatten_array([[[1,2],[1,2]],[[1,2],[1,2]]]).to_s