class List < ActiveRecord::Base
    belongs_to :forecast
    has_many :temps
    has_many :weathers
end
