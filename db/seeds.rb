# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin.com',
  password: 'passpass'
  )

Customer.create!(
  email: 'user@user.com',
  password: 'testtest',
  last_name: 'たなか',
  first_name: 'たなか',
  last_name_kana: 'タナカ',
  first_name_kana: 'タナカ',
  zip_code: '555',
  address: '東京都',
  phone_number: '555'
  )