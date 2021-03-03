class CreateSavedActions < ActiveRecord::Migration[5.2]
    def change
      create_table :saved_actions do |t|
        t.references :user
        t.references :action
        t.timestamps null: false
      end 
    end 
  end 