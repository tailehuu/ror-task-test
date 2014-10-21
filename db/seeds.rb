#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
Post.create(:title => 'hello world')
Post.create(:title => "xin chào")

Service.delete_all
Service.create(:name => 'Service One')
Service.create(:name => 'Service Two')

LineItem.delete_all
LineItem.create(:name => 'Line Item One')
LineItem.create(:name => 'Line Item Two')
