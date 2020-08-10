module FHIR
  # fhir/terminology_capabilities_closure.rb
  class TerminologyCapabilitiesClosure < BackboneElement
    include Mongoid::Document
    embeds_one :translation, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.translation.nil? 
        result['translation'] = self.translation.value
        serialized = Extension.serializePrimitiveExtension(self.translation)            
        result['_translation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesClosure.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['translation'] = PrimitiveBoolean.transform_json(json_hash['translation'], json_hash['_translation']) unless json_hash['translation'].nil?

      result
    end
  end
end
