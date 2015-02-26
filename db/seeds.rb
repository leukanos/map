# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  Dictionary.create(kind: :form, symbol: "forma_#{i}")
  Dictionary.create(kind: :activity, symbol: "aktywność_#{i}")

  Project.create(short_name: "project_#{i}", name: "Projekt #{i}")
end