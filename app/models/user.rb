class User < ActiveRecord::Base
   has_secure_password 
   has_many :actions
   has_many :saved_actions
   has_many :actions, through: :saved_actions
end 

