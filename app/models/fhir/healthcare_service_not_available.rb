module FHIR
  # fhir/healthcare_service_not_available.rb
  class HealthcareServiceNotAvailable < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :during, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.during.nil? 
        result['during'] = self.during.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = HealthcareServiceNotAvailable.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['during'] = Period.transform_json(json_hash['during']) unless json_hash['during'].nil?

      result
    end
  end
end
