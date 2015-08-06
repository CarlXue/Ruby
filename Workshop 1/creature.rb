class Creature

  attr_accessor :xPos
  attr_accessor :yPos
  attr_accessor :health

  def init
    @xPos = 0
    @yPos = 0
    @health = 0
  end

  def moveForward()
    @xPos += 10
  end

  def getDistanceFromCentre()
    return Math.sqrt(@xPos**@xPos + @yPos**@yPos)
  end

  def moveRight()
    @yPos += 10
  end
end