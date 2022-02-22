# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(
#   email: 'user@test.com',
#   password: 'testtest',
# )


Order.create!(
    customer_id: 1,
    zip_code: "1111111",
    address: "大阪市北区",
    name: "田中花子",
    postage: 800,
    order_status: 0,
    total_amount: 1500,
    payment: 0,
)
Genre.create!(
  name: "ケーキ",
)


Item.create!(
  genre_id: 1,
  name: "田中花子",
  introduction: "こんにちは",
  tax_included: 1650,
  is_active: true,
)
OrderItem.create!(
  item_id: 1,
  order_id: 1,
  item_status: 0,
  quantity: 1,
  tex_excluded: 1650,
)


