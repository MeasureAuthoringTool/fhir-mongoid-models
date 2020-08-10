module FHIR
  # fhir/consent_provision_data.rb
  class ConsentProvisionData < BackboneElement
    include Mongoid::Document
    embeds_one :meaning, class_name: 'FHIR::ConsentDataMeaning'    
    embeds_one :reference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.meaning.nil? 
        result['meaning'] = self.meaning.value
        serialized = Extension.serializePrimitiveExtension(self.meaning)            
        result['_meaning'] = serialized unless serialized.nil?
      end
      unless self.reference.nil? 
        result['reference'] = self.reference.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConsentProvisionData.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['meaning'] = ConsentDataMeaning.transform_json(json_hash['meaning'], json_hash['_meaning']) unless json_hash['meaning'].nil?
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?

      result
    end
  end
end
