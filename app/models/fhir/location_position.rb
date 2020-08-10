module FHIR
  # fhir/location_position.rb
  class LocationPosition < BackboneElement
    include Mongoid::Document
    embeds_one :longitude, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :latitude, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :altitude, class_name: 'FHIR::PrimitiveDecimal'    
    
    def as_json(*args)
      result = super      
      unless self.longitude.nil? 
        result['longitude'] = self.longitude.value
        serialized = Extension.serializePrimitiveExtension(self.longitude)            
        result['_longitude'] = serialized unless serialized.nil?
      end
      unless self.latitude.nil? 
        result['latitude'] = self.latitude.value
        serialized = Extension.serializePrimitiveExtension(self.latitude)            
        result['_latitude'] = serialized unless serialized.nil?
      end
      unless self.altitude.nil? 
        result['altitude'] = self.altitude.value
        serialized = Extension.serializePrimitiveExtension(self.altitude)            
        result['_altitude'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = LocationPosition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['longitude'] = PrimitiveDecimal.transform_json(json_hash['longitude'], json_hash['_longitude']) unless json_hash['longitude'].nil?
      result['latitude'] = PrimitiveDecimal.transform_json(json_hash['latitude'], json_hash['_latitude']) unless json_hash['latitude'].nil?
      result['altitude'] = PrimitiveDecimal.transform_json(json_hash['altitude'], json_hash['_altitude']) unless json_hash['altitude'].nil?

      result
    end
  end
end
