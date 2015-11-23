class Location
  
  include Mongoid::Document
  include Mongoid::Geospatial

  field :vehicle_count, type: Integer
  field :restricted_p, type: String
  field :description, type: String
  field :market_id, type: Integer
  field :location_id, type: Integer
  field :has_vans, type: Integer
  field :zipfleet_id, type: Integer

  field :coordinates, :type => Point

  spatial_index :coordinates

  index({coordinates: "2d"})

end
