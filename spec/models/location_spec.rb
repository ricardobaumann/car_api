require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "find by coordinates" do
  	it "should return the right locations" do
  		#51.5444204,-0.22707
  		locations = Location.geo_near([51.5444204, -0.22707])
  		locations.should_not be_nil
  		locations.each do |location|
  			p "#{location.coordinates} #{location.description}"
  		end
  	end
  end
end

=begin

{
    "cars": [
      {
        "description": "West Ealing - Hartington Rd",
        "latitude": 51.511318,
        "longitude": -0.318178
      },
      {
        "description": "Sudbury - Williams Way",
        "latitude": 51.553667,
        "longitude": -0.315159
      },
      {
        "description": "West Ealing - St Leonard’s Rd",
        "latitude": 51.512107,
        "longitude": -0.313599
      }
    ]
}

=end