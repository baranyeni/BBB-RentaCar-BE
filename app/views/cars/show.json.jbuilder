json.partial! 'cars/car', car: @car
json.picture_urls @car.pictures.map { |picture| picture.url }
json.rental_dates @car.unavailable_dates