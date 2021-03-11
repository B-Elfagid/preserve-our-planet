class AddCreatorToActions < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :creator_id, :integer 
  end
end
