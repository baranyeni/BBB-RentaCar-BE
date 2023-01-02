class AddCarIdToCarPictures < ActiveRecord::Migration[7.0]
  def change
    add_reference :car_pictures, :car, null: false
    remove_reference :cars, :car_picture, null: false
  end
end
