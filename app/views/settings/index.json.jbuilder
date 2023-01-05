json.colors do
  json.array! @colors do |color|
    json.id color.id
    json.name color.name
    json.hex color.hex
  end
end

json.brands do
  json.array! @brands do |brand|
    json.id brand.id
    json.name brand.name
    json.logo_url brand.logo_url
  end
end

json.locations do
  json.array! @locations do |location|
    json.id location.id
    json.city location.city
    json.address location.address
  end
end