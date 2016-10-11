# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FactoryGirl.create_list(:walker, 5, region: 'Centro')
FactoryGirl.create_list(:walker, 6, region: 'Norte')
FactoryGirl.create_list(:walker, 3, region: 'Oeste')
FactoryGirl.create_list(:walker, 7, region: 'Sul')
FactoryGirl.create_list(:walker, 2, region: 'Leste')
