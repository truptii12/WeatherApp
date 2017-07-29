class User < ActiveRecord::Base
     def self.create_from_omniauth(auth)
       create! do |user|
         user.provider = auth["provider"]
         user.userid = auth["uid"]
         user.name = auth["info"]["nickname"]
end end
end