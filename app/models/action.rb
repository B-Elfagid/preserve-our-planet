class Action < ActiveRecord::Base
     belongs_to :user
     has_many :saved_actions
     has_many :users, through: :saved_actions
end 