class Action < ActiveRecord::Base
     belongs_to :user
     has_many :saved_actions
     has_many :users, through: :saved_actions
     validates :name, presence: true, uniqueness: true
     validates :title, presence: true
     validates :description, presence: true
     validates :fact, presence: true
end 