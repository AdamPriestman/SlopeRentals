class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :equipment_type
      t.string :location
      t.integer :price_per_day
      t.integer :size
      t.string :condition
      t.string :brand
      t.string :gender

      t.timestamps
    end
  end
end
