json.array! @rentals do |rental|
  json.extract! rental, :id, :start_date, :end_date, :price

  json.car do
    json.partial! 'cars/car', car: rental.car
    end
end
