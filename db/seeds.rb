# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Article.__elasticsearch__.create_index!(force: true)

User.create!(email: 'a1@samplep.com', password: '123456', name: 'aaa')
User.create!(email: 'b2@samplep.com', password: '123456', name: 'bbbb')
User.create!(email: 'c2@samplep.com', password: '123456', name: 'cccc')



Article.create!(text: 'sample blog1', title: 'this is title1')
Article.create!(text: 'sample blog2', title: 'this is title2')
