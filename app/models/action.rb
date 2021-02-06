class Action < ActiveRecord::Base
     belongs_to :user
     has_many :users, through: :savedactions
end 