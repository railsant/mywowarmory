require 'httparty'
class MyWoWArmory
  include HTTParty
  base_uri 'www.mywowarmory.com'
  
  def initialize(username,password,options={})
    @auth = {:username => username, :password => password}
  end
  
  def get_profile(country,realm,character_name,options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/api/profiles/#{country}/#{realm}/#{character_name}.json", options).parsed_response
  end
end