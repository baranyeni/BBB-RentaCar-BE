json.array! @rentals do |rental|
  json.extract! rental, :id, :start_date, :end_date, :price, :car_id
end
