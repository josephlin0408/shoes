# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
    User.create(name: 'admin', email: 'admin@gmail.com', password: '123456789', password_confirmation: '123456789', admin: '1')
    User.create(name: 'seller', email: 'seller@gmail.com', password: '123456789', password_confirmation: '123456789', seller: '1')
    User.create(name: 'user', email: 'user@gmail.com', password: '123456789', password_confirmation: '123456789')

