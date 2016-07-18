require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "find by coordinates" do
  	it "should return the right locations" do
  		location = Location.geo_near([-0.318178,51.511318]).first
  		location.should_not be_nil
  		expect(location.description).to eq("West Ealing - Hartington Rd")
  	end
  end
end