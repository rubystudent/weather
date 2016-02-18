
class Weather
  attr_accessor :city_name,:temp

  def initialize (city_name,temp)
  	@city_name, @temp = city_name, temp
  	@created_time=Time.now
    #date удалил нахуй, потому что дата принемает параметры, но она здесь нахуй не нужна, в тайм есть дата
  end	

  def weather_info
  	"City:#{@city_name},Temp(C):#{@temp},Time:#{@created_time}"
  end
end
