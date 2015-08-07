class LifeGame
  attr_reader :worldStr, :x, :y
  def initialize()
    @worldStr = nil
  end

  def setSize(x,y)
    x[-1] = "" if x[-1] == "\n"
    y[-1] = "" if y[-1] == "\n"
    @x = x
    @y = y
  end

  def isSizeValid?()
    if @x.to_i < 1 or @x.to_i > 100 or @y.to_i < 1 or @y.to_i > 100
      @worldStr = getExceptionMessage(@x,@y)
      return false
      exit
    end
    return true
  end

  def getExceptionMessage(x,y)
    "Wrong number(s): (#{x},#{y}), please check your input!"
  end

  def createWorld
    if isSizeValid?
      @worldStr = ""
      @x.to_i.times{
        @worldStr += ("*" * @y.to_i) + "\n"
      }
    end
  end

  def printWorld
    if !@worldStr.nil?
      puts @worldStr
    end
  end

  def setLifePoint(arr)
    @lifePointArr = []
    arr.each{ |point|
      point[-1] = "" if point[-1].eql?("\n")
      x , y = point.split(",")
      @lifePointArr << [x.to_i,y.to_i]
    }
  end

  def isLifeNumberValid?(x,y)
    if x.to_i < 0 or x.to_i >= @x.to_i or y.to_i < 0 or y.to_i >= @y.to_i
      @worldStr = getExceptionMessage(x,y)
      return false
    end
    return true
  end

  def updateLifePoint()
    @lifePointArr.each{ |lp|
      x = lp[0]
      y = lp[1]
      if isLifeNumberValid?(x,y)
        index = getIndex(x,y)
        @worldStr[index] = "#"
      else
        return
      end
    }
  end

  def getIndex(x,y)
    if x == 0
      y
    else
      @y.to_i + (x-1)*(@y.to_i+1) + y+1
    end
  end

end
