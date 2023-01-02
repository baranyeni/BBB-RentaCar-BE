class CreateCarPictures < ActiveRecord::Migration[7.0]
  def change
    create_table :car_pictures do |t|
      t.string :url, null: false

      t.timestamps
    end
  end
end
