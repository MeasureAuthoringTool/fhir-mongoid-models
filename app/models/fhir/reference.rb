module FHIR
  # fhir/reference.rb
  class Reference < Element
    include Mongoid::Document
    embeds_one :reference, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.reference.nil? 
        result['reference'] = self.reference.value
        serialized = Extension.serializePrimitiveExtension(self.reference)            
        result['_reference'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Reference.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = PrimitiveString.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?
      result['type'] = PrimitiveUri.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?

      result
    end
  end
end
