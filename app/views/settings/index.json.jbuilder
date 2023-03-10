json.colors do
  @colors.each do |color|
    json.set! color.id do
      json.name color.name
      json.hex color.hex
    end
  end

end

json.brands do
  @brands.each do |brand|
    json.set! brand.id do
      json.name brand.name
      json.logo_url brand.logo_url
    end
  end
end

json.locations do
  @locations.each do |location|
    json.set! location.id do
      json.city location.city
      json.address location.address
    end
  end
end

json.cars do
  @cars.each do |car|
    json.set! car.id do
      json.brand do
        json.id car.brand.id
        json.name car.brand.name
        json.logo_url car.brand.logo_url
      end
      json.model car.model
      json.plate_number car.plate_number
      json.color do
        json.id car.color.id
        json.name car.color.name
        json.hex car.color.hex
      end
      json.location do
        json.id car.location.id
        json.city car.location.city
        json.address car.location.address
      end
      json.description car.description
      json.availability car.availability
      json.fuel_type car.fuel_type
      json.gear_type car.gear_type
      json.price_per_day car.price_per_day
      json.price_per_month car.price_per_month
      json.picture_urls car.pictures.map { |picture| picture.url }
    end
  end
end