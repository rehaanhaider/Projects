# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Article.__elasticsearch__.create_index!(force: true)

User.create!(email: 'a@samplep.com', password: '123456', name: 'aaa')
User.create!(email: 'b@samplep.com', password: '123456', name: 'bbbb')


Article.create!(text: 'sample blog', title: 'this is title')
Article.create!(text: 'sample blog 2', title: 'this is title 2')
