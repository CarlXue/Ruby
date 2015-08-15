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
    combination = roll_all_sides.permutation(diceNum).to_a.uniq
    print (combination)
  end

  def roll_dice
    (0...diceNum).each { |i|
      roll_result = 1 + rand(sideNum)
      printf("This is dice No. %d, roll result is %d\n", i+1, roll_result)
    }
  end

end
