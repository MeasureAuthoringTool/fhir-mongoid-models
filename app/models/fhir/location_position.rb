module FHIR
  # fhir/location_position.rb
  class LocationPosition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'LocationPosition'
    embeds_one :longitude, class_name: 'PrimitiveDecimal'
    embeds_one :latitude, class_name: 'PrimitiveDecimal'
    embeds_one :altitude, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash)
      result = LocationPosition.new
      result['longitude'] = PrimitiveDecimal.transform_json(json_hash['longitude'], json_hash['_longitude']) unless json_hash['longitude'].nil?      
      result['latitude'] = PrimitiveDecimal.transform_json(json_hash['latitude'], json_hash['_latitude']) unless json_hash['latitude'].nil?      
      result['altitude'] = PrimitiveDecimal.transform_json(json_hash['altitude'], json_hash['_altitude']) unless json_hash['altitude'].nil?      

      result
    end
  end
end
