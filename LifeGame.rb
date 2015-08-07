class LifeGame
  attr_reader :worldStr, :x, :y
  
  def initialize()
    @worldStr = nil
  end

  def setSize(x,y)
    @x = x
    @y = y
  end

  def checkSize()
    if @x < 1 or @x > 100 or @y < 1 or @y > 100
      @worldStr = getExceptionMessage
    end
  end

  def getExceptionMessage()
    "Wrong number(s): (#{@x},#{@y}), please check your input!"
  end

  def createWorld
    checkSize()
    if @worldStr.nil?
      @worldStr = ""
      @x.times{
        @worldStr += ("*" * @y) + "\n"
      }
    end
  end

  def printWorld
    puts @worldStr
  end

end
