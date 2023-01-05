json.array! @cars do |car|
  json.partial! 'cars/car', car: car
  json.picture_url car.pictures.first&.url
end
