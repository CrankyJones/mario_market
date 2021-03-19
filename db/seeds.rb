require 'faker'

Product.destroy_all
Review.destroy_all

10.times do |t|
  product = Product.create!(name: Faker::Appliance.unique.equipment, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
  5.times do |t|
    review = product.reviews.create!(title: Faker::Lorem.sentence(word_count: 3) , author: Faker::FunnyName.name, rating: Faker::Number.between(from: 1, to: 5), content_body: Faker::Lorem.paragraph(sentence_count: 4))
  end
end

20.times do |t|
  product = Product.create!(name: Faker::Beer.unique.brand, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
  5.times do |t|
    review = product.reviews.create!(title: Faker::Lorem.sentence(word_count: 3) , author: Faker::FunnyName.name, rating: Faker::Number.between(from: 1, to: 5), content_body: Faker::Lorem.paragraph(sentence_count: 4))
  end
end

20.times do |t|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
  5.times do |t|
    review = product.reviews.create!(title: Faker::Lorem.sentence(word_count: 3) , author: Faker::FunnyName.name, rating: Faker::Number.between(from: 1, to: 5), content_body: Faker::Lorem.paragraph(sentence_count: 4))
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"