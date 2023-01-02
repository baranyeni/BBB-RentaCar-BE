class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :plate_number, index: { unique: true }
      t.string :description
      t.string :availability, null: false, default: 'available'
      t.string :fuel_type
      t.string :gear_type
      t.string :model
      t.references :brand, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :car_picture
      t.references :location
      t.integer :kilometer, null: false, default: 0
      t.integer :model_year, null: false
      t.float :price_per_day, null: false
      t.float :price_per_month, null: false

      t.timestamps
    end
  end
end
