module FHIR
  # fhir/person_link.rb
  class PersonLink < BackboneElement
    include Mongoid::Document
    embeds_one :target, class_name: 'FHIR::Reference'    
    embeds_one :assurance, class_name: 'FHIR::IdentityAssuranceLevel'    
    
    def as_json(*args)
      result = super      
      unless self.target.nil? 
        result['target'] = self.target.as_json(*args)
      end
      unless self.assurance.nil? 
        result['assurance'] = self.assurance.value
        serialized = Extension.serializePrimitiveExtension(self.assurance)            
        result['_assurance'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PersonLink.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?
      result['assurance'] = IdentityAssuranceLevel.transform_json(json_hash['assurance'], json_hash['_assurance']) unless json_hash['assurance'].nil?

      result
    end
  end
end
