class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.string :postal_cord, null: false
      t.integer :prefecture_id, null: false
      t.string :area, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :sale, null: false, foreign_key: true
      t.timestamps
    end
  end
end
