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