require 'httparty'
require 'ostruct'
require 'open-uri'
require 'wow_community_api'
require 'multi_json'

class MyWoWArmory
  include HTTParty
  # base_uri 'www.mywowarmory.com'
  base_uri 'www.mywowarmory.com'
  
  # def initialize(username,password,options={})
  #   @auth = {:username => username, :password => password}
  # end
  
  def get_profile(country,realm,character_name,options={})
    # options.merge!({:basic_auth => @auth})
    name = URI::encode(character_name)
    # self.class.get("/api/profiles/#{country}/#{realm.tr('^a-zA-Z','-').downcase}/#{name}.json", options).parsed_response
    
    realm_response = HTTParty.get("http://#{country}.battle.net/api/wow/realm/status?realms=#{realm}").parsed_response['realms']
    if realm_response.count == 1 
      realm = realm_response['slug'] 
    end
    
    
    options.merge!(:query => {:name => character_name, :server => realm, :country => country})
    MultiJson.decode(self.class.get("/api/getprofile.php", options).parsed_response)
  end
  class Profile < OpenStruct
  end
end

OpenStruct.send(:define_method, :id) { @table[:id] }