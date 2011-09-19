require 'helper'

class TestMywowarmory < Test::Unit::TestCase
  # should "probably rename this file and start testing for real" do
  #   # flunk "hey buddy, you should probably rename this file and start testing for real"
  # end
  
  should "get profile" do 
    api = MyWoWArmory.new
    response = api.get_profile('us','kul-tiras','gary')
    puts response.inspect
    response = api.get_profile('us','Tichondrius','Slapshøt')
    puts response.inspect
    response = api.get_profile("us", "Mal'Ganis", 'gary')
    puts response.inspect
    
    # require 'cgi'
    # require 'uri'
    # string = 'Iñtërnâtiônàlizætiøn'
    # puts URI.encode(string)
    # puts URI.escape(string, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    # puts URI.escape(string.force_encoding('ascii'))
    # puts CGI.escape(string)
    # assert(response.path)
  end
end
