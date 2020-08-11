module FHIR
  # fhir/patient_link.rb
  class PatientLink < BackboneElement
    include Mongoid::Document
    embeds_one :other, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::LinkType'    
    
    def as_json(*args)
      result = super      
      unless self.other.nil? 
        result['other'] = self.other.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PatientLink.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['other'] = Reference.transform_json(json_hash['other']) unless json_hash['other'].nil?
      result['type'] = LinkType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?

      result
    end
  end
end
