require 'helper'

class TestMywowarmory < Test::Unit::TestCase
  # should "probably rename this file and start testing for real" do
  #   # flunk "hey buddy, you should probably rename this file and start testing for real"
  # end
  
  should "get profile" do 
    api = MyWoWArmory.new
    # response = api.get_profile('us','kul-tiras','gary')
    # puts response.inspect
    response = api.get_profile('us','Tichondrius','Slapshøt')
    puts response.inspect
    response = api.get_profile("us", "Mal'Ganis", 'gary')
    puts response.inspect
    response = api.get_profile("us", "Kel'Thuzad", 'Chaoticblade')    
    puts response.inspect
    
    response = api.get_profile "us","Lightning's Blade","Bools"
    puts response.inspect
  end
end
