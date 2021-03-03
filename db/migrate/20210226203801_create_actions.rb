class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :title
      t.text :description
      t.string :fact
      t.string :image
      t.timestamps null: false
    end 
  end 
end