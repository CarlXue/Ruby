class DiceRoll
  #variables definition
  attr_accessor :diceNum
  attr_accessor :sideNum
  #define a int to store roll results
  @@roll_result = 0
  #define an array to store all the sides
  @@roll_all_sides = []
  # initialisation
  def init(diceNum, sideNum)
    self.diceNum = diceNum
    self.sideNum = sideNum
  end

  def all_possibilities
    #put all sides in the array
    for i in 0...sideNum
      for j in 0...diceNum
        @@roll_all_sides.push(i+1)
      end
    end
    @@combination = @@roll_all_sides.combination(diceNum).to_a
    print (@@combination)
  end

  def roll_dice
    for i in 0...diceNum
      @@roll_result = 1 + rand(sideNum)
      printf("This is dice No. %d, roll result is %d\n",i+1,@@roll_result)
    end
  end

end