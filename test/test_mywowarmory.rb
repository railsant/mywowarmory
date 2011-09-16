require 'helper'

class TestMywowarmory < Test::Unit::TestCase
  # should "probably rename this file and start testing for real" do
  #   # flunk "hey buddy, you should probably rename this file and start testing for real"
  # end
  
  should "get profile" do 
    api = MyWoWArmory.new
    response = api.get_profile('us','kul-tiras','gary')

    # assert(response.path)
  end
end
