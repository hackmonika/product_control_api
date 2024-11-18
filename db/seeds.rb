user_admin = User.create!(email_address: 'admin@example.com', password: 'password')
sample_admin = User.create!(email_address: 'example@example.com', password: 'password')

10.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 1.0..100.0, as_string: false),
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end
