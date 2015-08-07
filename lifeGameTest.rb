require 'test/unit'
require 'LifeGame'

class MainTest < Test::Unit::TestCase
  # test sotry 1:
  def test_LG_Story1
    @game = LifeGame.new

    #1.AC1
    givenStory1("4","5")
    whenStory1()
    thenStory1()
    
    expectWorldStr = "*****\n*****\n*****\n*****\n"
    assert_equal(expectWorldStr,@game.worldStr)
    
    #2.AC2
    givenStory1("120","5")
    whenStory1()
    thenStory1()
    
    expectWorldStr = "Wrong number(s): (120,5), please check your input!"
    assert_equal(expectWorldStr,@game.worldStr)
  end

  def givenStory1(x,y)
     @game.setSize(x,y)
  end

  def whenStory1()
    @game.isSizeValid?
  end

  def thenStory1()
    @game.createWorld
  end
  
  # test story 2:
  def test_LG_Story2
    @game = LifeGame.new
   
    #1.AC1
    givenStory2("4","5")
    whenStory2(["0,0","2,3","1,1","3,2","End"])
    thenStory2()
       
    expectWorldStr = "#****\n*#***\n***#*\n**#**\n"
    assert_equal(expectWorldStr,@game.worldStr)
       
    #2.AC2
    givenStory2("4","5")
    whenStory2(["10,10","End"])
    thenStory2()
       
    expectWorldStr = "Wrong number(s): (10,10), please check your input!"
    assert_equal(expectWorldStr,@game.worldStr)
  end
  
  def givenStory2(x,y)
    @game.setSize(x,y)
  end

  def whenStory2(arr)
   @game.setLifePoint(arr)
  end

  def thenStory2()
    @game.createWorld()
    @game.updateLifePoint()
  end
  
end