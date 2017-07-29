class City < ActiveRecord::Base
  belongs_to :location
  belongs_to :forecast
end
