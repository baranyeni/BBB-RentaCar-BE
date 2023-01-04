json.array! @rentals do |rental|
  json.extract! rental, :id, :start_date, :end_date, :price, :car_id
  json.car_model rental.car.model
  json.car_picture_url rental.car.pictures.first.url
end
