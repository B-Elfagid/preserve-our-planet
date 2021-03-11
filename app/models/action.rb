class Action < ActiveRecord::Base
     require_relative 'image_uploader'
     mount_uploader :image, ImageUploader
     has_many :saved_actions
     has_many :users, through: :saved_actions
     belongs_to :creator, class_name: "User"
     validates :title, presence: true
     validates :description, presence: true
     
     
     def add_or_remove(user)
          if user.actions.include?(self)
            "remove"
          else 
            "add"
          end 

     end 

end 
