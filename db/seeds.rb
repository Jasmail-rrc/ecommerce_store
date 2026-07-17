AdminUser.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

Product.destroy_all
Category.destroy_all

category_names = [
  "Running Shoes",
  "Basketball Shoes",
  "Casual Shoes",
  "Sandals"
]

categories = category_names.map do |category_name|
  Category.create!(
    name: category_name,
    description: "#{category_name} available at Prairie Kicks."
  )
end

categories.each do |category|
  25.times do
    Product.create!(
      name: "#{Faker::Company.name} #{Faker::Commerce.product_name}",
      description: Faker::Lorem.paragraph(sentence_count: 3),
      price: Faker::Commerce.price(range: 30.0..300.0),
      stock_quantity: rand(1..100),
      category: category
    )
  end
end

puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"