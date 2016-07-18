# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'mongo'
Location.destroy_all
json_data = JSON.parse(File.read("#{Rails.root}/data.json"))
#p json_data
locations = json_data["locations"]

locations.each do |row|
	skip_attrs = ["latitude","longitude"]
	attributes = Hash[row.map { |k, v| [k.underscore, v] }].reject!{ |k| skip_attrs.include?(k) }
	#p "----------------------"
	#p row["latitude"].to_f
	coordinates = {coordinates: {:lat => (row["latitude"].to_f),:lng => (row["longitude"].to_f)}}
	Location.create! attributes.merge(coordinates)
end
