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


Admin.create!(
  email: "a@a",
  password: "aaaaaa",
  )

  Item.create!(
  genre_id: 1,
  name: "田中花子",
  introduction: "こんにちは",
  tax_included: 1650,
  is_active: true,
)
#   Character.create(name: 'Luke', movie: movies.first)
