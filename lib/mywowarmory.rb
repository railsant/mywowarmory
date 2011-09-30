require 'httparty'
require 'ostruct'
require 'open-uri'
require 'wow_community_api'
require 'multi_json'

class MyWoWArmory
  include HTTParty
  base_uri 'www.mywowarmory.com'
  
  # def initialize(username,password,options={})
  #   @auth = {:username => username, :password => password}
  # end
  
  def get_profile(country,realm,character_name,options={})
    # options.merge!({:basic_auth => @auth})
    
    # Hack to get the character_name encode once
    name = URI::encode(URI::decode(character_name))
    
    # Check the realm
    realm_response = HTTParty.get("http://#{country}.battle.net/api/wow/realm/status", :query => {:realms => URI.encode(realm)} ).parsed_response
    realm = realm_response['realms'].select{|r| r['name'] == realm}.first['slug']
    
    query = {:name => character_name, :server => realm, :country => country}
    query.merge!(:style => options[:style]) if options[:style].present?

    MultiJson.decode(self.class.get("/api/getprofile.php", options.merge(:query => query)).parsed_response)
  end
  class Profile < OpenStruct
  end
end

OpenStruct.send(:define_method, :id) { @table[:id] }