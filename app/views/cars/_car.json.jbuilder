json.extract! car, :id, :plate_number, :description, :availability, :fuel_type, :gear_type,
              :model, :model_year, :price_per_day, :price_per_month, :created_at, :updated_at

json.brand car.brand.name

json.location do
  json.city car.location.city
  json.address car.location.address
end

json.color do
  json.name car.color.name
  json.hex car.color.hex
end