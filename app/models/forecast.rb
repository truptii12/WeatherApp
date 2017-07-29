class Forecast < ActiveRecord::Base
 has_many :lists
 has_many :cities
 accepts_nested_attributes_for :lists
def initial_setup
@list1=List.all
@list1.each do |list|
list.destroy
end
@temp1=Temp.all
@temp1.each do |temp|
temp.destroy
end
end
def get_weather        
  #ForecastIO.forecast(lat, lng)

 # options = { units: "metric", APPID: "a496f6cc9d256a3b5bcae251b1aae713" }
#OpenWeather::Current.city("Cochin, IN", options)
#OpenWeather::ForecastDaily.city(lat, options)
response = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?q='+city+'&mode=Json&units=metric&cnt=16&APPID=a496f6cc9d256a3b5bcae251b1aae713')
   # @humidity= response['main']['humidity']
   # @humidity = response['humidity'] ? response['humidity'] : nil
    #puts response
     body = JSON.parse(response.body)
    # puts body.inspect
    @city = body["city"]
    @cnt= body["cnt"]
     
    puts @cnt
    num=@cnt
    body["list"].each do |list|
    @weather=list["weather"]
     puts @weather
    @lists = List.new
    @lists.dt= list["dt"]
    @lists.humidity=list["humidity"]
    @lists.pressure=list["pressure"]
    
    @lists.save
    @temp= Temp.new
  #  @temp.list_id=@lists.id
    @temp.dt=list["dt"]
     @temp.day= list["day"]
     @temp.min=list["temp"]["min"]
     @temp.max= list["temp"]["max"]
     @temp.night=list["temp"]["night"]
     @temp.eve= list["temp"]["eve"]
     @temp.morn=list["temp"]["morn"]
     
     @temp.save
    @weather = Weather.new
    @weather.main = list["weather"][0]["main"]
    @weather.description = list["weather"][0]["description"]
    @weather.icon=list["weather"][0]["icon"]
    @weather.dt=list["dt"]
    @weather.save
   #  @weather = Weather.new
    #@weather= list["weather"]
    # @weather.description= list["weather"]["description"]
    # @weather.icon= list["weather"]["icon"]
    # puts @lists.inspect
   # puts @weather.inspect
 #   @temp.save
    #@weather.save
    
    end
    puts @cnt.inspect
    puts @dt
    #puts @humidity.inspect
    #puts @forecast
    
   
   # @lists= List.new()
 #   @lists.save
    #lists =body["list"]
    
    #puts lists[0].inspect
 #   @list =lists[0]
    #@lists.humidity=lists[0][:humidity]
    #body = JSON.parse(@list.body)
#    @lists.dt=body["dt"]
#    @lists.humidity=body["humidity"]
#    puts @lists.inspect
   # @list.save
  #  if((lists.at(0)=='['))
   #       puts @cnt.inspect
    #        lists=lists.from(1).to(-2) 
    #        puts lists.inspect
    #    end
     #   puts lists.inspect
    #@lists =JSON.parse(lists.body)
    #@lists.save
    
    
    

    #puts self.weather.inspect
    #body = JSON.parse(response.)
    #list= response.JSON["lists"]
    #list.each do |item|
     #   puts item["day"]
     #   puts item["min"]
     #   puts item["max"]
    #end
    #@humidity = body["humidity"]
    #puts @humidity.inspect
    
end

end
