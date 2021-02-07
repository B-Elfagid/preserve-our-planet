class SavedAction < ActiveRecord::Base
     belongs_to :user
     belongs_to :action
     validates :user, presence: true
     validates :action, presence: true
end 