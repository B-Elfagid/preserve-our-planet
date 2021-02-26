class Action < ActiveRecord::Base
     require_relative 'image_uploader'
     mount_uploader :image, ImageUploader
     belongs_to :user
     has_many :saved_actions
     has_many :users, through: :saved_actions
     validates :name, presence: true
     validates :title, presence: true
     validates :description, presence: true
     validates :fact, presence: true

end 
