namespace :db do
  desc "Creates records for all models"
  task populate: :environment do
    puts "Generating users"
    10.times do |i|
      User.create(
        email: "user_#{i}@example.com",
        password: "password_#{i}",
        password_confirmation: "password_#{i}",
        first_name: "First_#{i}",
        last_name: "Last_#{i}",
        phone_number: "1234567890",
        birthdate: "1990-01-01"
      )
    end

    puts "Generating colors"
    color = %w[Black Blue Gray White]
    hex = %w[#000000 #0000FF #808080 #FFFFFF]
    color.count.times do |i|
      Color.create(name: color[i], hex: hex[i])
    end

    puts "Generating brands"
    brand = %w[Audi Fiat Renault Skoda]
    brand.count.times do |i|
      Brand.create(name: brand[i])
    end

    puts "Generating locations"
    location = %w[Istanbul Ankara Izmir Bursa]
    location.count.times do |i|
      Location.create(city: location[i], address: "Address_#{i}")
    end

    puts "Generating cars"
    4.times do |i|
      Car.create(
        plate_number: "34 AAA 00#{i + 1}",
        description: "Example description",
        availability: "available",
        fuel_type: "gasoline",
        gear_type: "automatic",
        model: "example",
        brand: Brand.all.sample,
        color: Color.all.sample,
        location: Location.all.sample,
        kilometer: 1000,
        model_year: 2010 + i,
        price_per_day: 100 + i*10,
        price_per_month: 2000 + i*25,
      )
    end

    puts "Generating car pictures"
    4.times do
      CarPicture.create(car: Car.where.missing(:pictures).sample, url: "http://baranyeni.com/BBB-Assets/example.jpeg")
    end
  end
end
