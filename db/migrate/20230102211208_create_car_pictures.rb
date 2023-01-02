class CreateCarPictures < ActiveRecord::Migration[7.0]
  def change
    create_table :car_pictures do |t|
      t.string :url, null: false
      t.references :car, null: false, foreign_key: true
    end
  end
end
