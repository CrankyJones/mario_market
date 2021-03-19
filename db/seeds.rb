Product.destroy_all
Review.destroy_all

50.times do |t|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
  5.times do |t|
    review = Review.create!(title: Faker::Lorem.words(number: 3) Faker::, author: Faker::FunnyName.name, content_body: Faker::Lorem.words(number: 15))
  end
end