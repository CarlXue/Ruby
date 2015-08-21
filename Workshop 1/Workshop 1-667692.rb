#Exercise 1
class Creature
  attr_accessor :xPos, :yPos, :health
  def initialize
    @xPos = 0
    @yPos = 0
    @health = 100
  end
  def moveForward
    @xPos += 10
  end
  def getDistanceFromCentre
    Math.sqrt(@xPos**2 + @yPos**2)
  end
  def moveRight
    @yPos += 10
  end
end


#Exercise 2
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

# function 4      #elements can be array as well
def flatten_array(array_group)
	#define a new flatten array
	new_array = Array.new()
	#traverse all the item in the array group
	array_group.each do |row|
    if row.is_a?(Array)
      flatten_array(row)
    else
      new_array << row
    end
	end
	puts new_array
end


#Exercise 3
class DiceRoll
  #variables definition
  attr_accessor :diceNum
  attr_accessor :sideNum
  # initialisation
  def init(diceNum, sideNum)
    self.diceNum = diceNum
    self.sideNum = sideNum
  end
  def all_possibilities
    roll_all_sides = []
    #put all sides in the array
    (0...sideNum).each do |i|
      (0...diceNum).each { roll_all_sides << i+1 }
    end
    permutation = roll_all_sides.permutation(diceNum).to_a.uniq
    print (permutation)
  end
  def roll_dice
    (0...diceNum).each { |i|
      roll_result = 1 + rand(sideNum)
      printf("This is dice No. %d, roll result is %d\n", i+1, roll_result)
    }
  end
end




#Exercise 4
def regex_sentence(string)
  expr_sentence = /^[A-Z]+[\w\s ,;"']*[.?!]$/
  string =~expr_sentence ? :true : :false
end

def regex_phone(string)
  expr_phone = /^\(?((0|\+61)(2|4|3|7|8))?\)?( |-)?[0-9]{2}( |-)?[0-9]{2}( |-)?[0-9]( |-)?[0-9]{3}$/
  string=~ expr_phone ? :true : :false
end

def regex_email(string)
  expr_email = /[a-z0-9._%+-]+@([a-z0-9]+)\.[a-z]{2,4}/
  string =~ expr_email ? :true : :false
end



#Exercise 5
def num_regex_matches(expr, string)
  string.scan(expr).count
end



#Exercise 6
def call_block
  if block_given?
    yield
  else
    return :no_block_provided
  end
end



#Exercise 7
def count_lines file
  file = File.open(file, "r")
  yield
  ensure
    file.close if file
end

count_lines("exercise_7.txt") do |file|
  line_counter = 0
  while line = file.gets
    line_counter += 1
  end
  puts line_counter
end



#Exercise 8
def unique_lines file1, file2
  file_lines = Array.new
  File.open(file1, "a+") do |file|
    while line = file.gets
      file_lines << line.delete("\n")
    end
  end
  File.open(file2, "a+") do |file|
    while line = file.gets
      if not(file_lines.include? (line.delete("\n")))
        file_lines << line
      else
        file_lines.delete(line.delete("\n"))
      end
    end
  end
  return file_lines
end

puts unique_lines "exercise_8_1.txt", "exercise_8_2.txt"


#Exercise 9
def longest_word(text)
  word_expr = /\w+/
  longest_length = 0
  longest_word = ''
  File.open(text, 'r+') do |file|
    while line = file.gets
      line.scan(word_expr).each do |word|
        if word.length > longest_length
          longest_word = word
          longest_length = word.length
        end
      end
    end
  end
  longest_word
end