require "LifeGame.rb"

game = LifeGame.new

puts "Please input the size:\n"
x = gets
y = gets
game.setSize(x,y)

if !game.isSizeValid?
  game.printWorld()
  exit
end

puts "Please input the life point:\n"

strArr = []
while(true)
  strArr << gets
  break if strArr.include?("End\n")
end

game.setLifePoint(strArr)
game.createWorld()
game.updateLifePoint
game.printWorld()
