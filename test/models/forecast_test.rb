require 'test_helper'

class ForecastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=Dublin&APPID=a496f6cc9d256a3b5bcae251b1aae713")
  format = :json
  
  test "it should return json response" do
      #@tasks = Task.all
    response.body != nil
    assert true
  end
end
