json.extract! @rental, :id, :start_date, :end_date, :user_id, :price

json.car do
  json.partial! 'cars/car', car: @rental.car
end