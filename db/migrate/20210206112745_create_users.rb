class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.text :seed_phrase
      t.timestamps null: false
    end 
  end 
   
end
