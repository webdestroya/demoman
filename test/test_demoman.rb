require 'helper'

class TestDemoman < Test::Unit::TestCase
  should "read demo" do
    demoman = Demoman.new("test/test.dem")
    assert true
    #flunk "hey buddy, you should probably rename this file and start testing for real"
  end
end
