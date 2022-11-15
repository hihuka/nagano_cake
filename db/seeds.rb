# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin02@admin.com',
  password: 'password'
  )

Customer.create!(
  email: 'naganouser@user.com',
  password: 'useruser',
  last_name: 'さとう',
  first_name: 'さとう',
  last_name_kana: 'サトウ',
  first_name_kana: 'サトウ',
  postal_code: '222',
  address: '東京都',
  telephone_number: '222'
  )