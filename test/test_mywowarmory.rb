require 'helper'

class TestMywowarmory < Test::Unit::TestCase
  # should "probably rename this file and start testing for real" do
  #   # flunk "hey buddy, you should probably rename this file and start testing for real"
  # end
  
  should "get profile" do 
    api = MyWoWArmory.new
    # response = api.get_profile('us','kul-tiras','gary')
    # puts response.inspect
    # response = api.get_profile('us','Tichondrius','Slapshøt')
    # puts response.inspect
    response = api.get_profile("us", "Mal'Ganis", 'gary')
    puts response.inspect
    # response = api.get_profile("us", "Kel'Thuzad", 'Chaoticblade')    
    # puts response.inspect
    # 
    # response = api.get_profile "us","Lightning's Blade","Bools"
    # puts response.inspect
    #     
    response = api.get_profile("us", "Mal'Ganis", "Gimlì")
    puts response.inspect
    
    response = api.get_profile("us", "Mal'Ganis", "Giml%C3%AC")
    puts response.inspect
    
    response = api.get_profile("us", "Aegwynn", "R%C3%A1y")
    puts response.inspect
    
    response = api.get_profile "us", "Stormrage", "Dieslówly"
    puts response.inspect
    
    response = api.get_profile "us", "Dalaran", "Wølfenstein"
    puts response.inspect
    
    response = api.get_profile "us","Zangarmarsh", "Jésuschrist"
    puts response.inspect
    
    response = api.get_profile "us",    "Dragonblight","Këk", :style => :vbarrack
    puts response.inspect  
  end
end
