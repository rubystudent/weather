require 'faraday'
require 'json'
require_relative 'weather'


class Main
    API_KEY='8ac651c7e79f6c100b7c767cb79b146a'

  attr_accessor :city_name  

  def initialize(city_name='London')
    @city_name=city_name
  end

  def weather
  	Weather.new(@city_name, conditions['main']['temp']).weather_info
  end

  def connection 
    @connection||= Faraday.new(url:'http://openweathermap.org') do |faraday|		
    faraday.request :url_encoded
    faraday.adapter Faraday.default_adapter #здесь слово адаптер неправильно написано было) 
    end #здесь енд забыл(может и не здесь, не помню)
  end

  def conditions
    response ||= connection.get("/data/2.5/weather?q=#{@city_name.gsub('-','_')}&units=metric&appid=#{API_KEY}")
    @conditions=JSON.parse(response.body)
  end 
end 
city_name = gets.delete "\n"
main = Main.new(city_name)
puts main.weather
