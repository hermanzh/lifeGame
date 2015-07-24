require 'test/unit'
require 'main'
require 'lifeGameClass'

class MainTest < Test::Unit::TestCase
  def testLG
    lf = lifeGameClass.new(4,5)

    result="*****
  *****
  *****
  *****
  *****"

    assert_equal(lf.printContent,result)
  end
end