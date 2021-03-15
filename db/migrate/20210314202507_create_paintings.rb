class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.string :painting_name
      t.string :year
      t.integer :artist_id
      t.integer :user_id
    end 
  end
end
