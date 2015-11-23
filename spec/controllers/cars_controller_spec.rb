require 'rails_helper'

RSpec.describe CarsController, type: :controller do

  describe "GET #index" do
    it "returns http success and the first 10 matches" do
      get :index, {coordinates: "51.5444204,-0.22707"}
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      json_response.length.should == 10
      first_location = json_response[0]
      expect(first_location['description']).to eq("Willesden - Acland Rd")
    end

    it "returns http success and the first matches sent by parameter" do
      get :index, {coordinates: "51.5444204,-0.22707", limit: 1}
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      json_response.length.should == 1
      first_location = json_response[0]
      expect(first_location['description']).to eq("Willesden - Acland Rd")
    end

    it "returns bad request on malformed coordinates params" do
    	get :index
    	expect(response).to have_http_status(:bad_request)
    	json_response = JSON.parse(response.body)
    	expect(json_response["message"]).to eq("Coordinates param can't be blank on GET")
    end

    it "returns bad request on malformed coordinates params" do
    	get :index, {coordinates: "51.5444204;-0.22707", limit: 1}
    	expect(response).to have_http_status(:bad_request)
    	json_response = JSON.parse(response.body)
    	expect(json_response["message"]).to eq("Coordinates param must be like <lat>,<long> on GET")
    end
  end

end
