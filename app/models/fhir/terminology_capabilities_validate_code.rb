module FHIR
  # fhir/terminology_capabilities_validate_code.rb
  class TerminologyCapabilitiesValidateCode < BackboneElement
    include Mongoid::Document
    embeds_one :translations, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.translations.nil? 
        result['translations'] = self.translations.value
        serialized = Extension.serializePrimitiveExtension(self.translations)            
        result['_translations'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesValidateCode.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['translations'] = PrimitiveBoolean.transform_json(json_hash['translations'], json_hash['_translations']) unless json_hash['translations'].nil?

      result
    end
  end
end
