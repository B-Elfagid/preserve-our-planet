class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :title
      t.text :description
      t.string :image
      t.text :fact
      t.references :user, foreign_key: {on_delete: :cascade}
      t.timestamps null: false
    end 
  end 
end