class User < ActiveRecord::Base
   has_secure_password 
   has_many :saved_actions
   has_many :actions, through: :saved_actions
   validates :password, length: {in: 8..100}, confirmation: true
   validates :username, uniqueness: true, length: {in: 5..30}
   validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
end 

