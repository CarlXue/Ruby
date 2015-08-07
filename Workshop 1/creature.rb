class Creature

  attr_reader :xPos, :yPos, :health

  def init
    @xPos = 0
    @yPos = 0
    @health = 100
  end

  def moveForward()
    @xPos += 10
  end

  def getDistanceFromCentre()
    return Math.sqrt(@xPos**2 + @yPos**2)
  end

  def moveRight()
    @yPos += 10
  end
end