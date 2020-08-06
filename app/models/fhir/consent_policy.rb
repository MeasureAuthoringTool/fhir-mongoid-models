module FHIR
  # fhir/consent_policy.rb
  class ConsentPolicy < BackboneElement
    include Mongoid::Document
    embeds_one :authority, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'    
    
    def as_json(*args)
      result = super      
      unless self.authority.nil? 
        result['authority'] = self.authority.value
        serialized = Extension.serializePrimitiveExtension(self.authority)            
        result['_authority'] = serialized unless serialized.nil?
      end
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConsentPolicy.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authority'] = PrimitiveUri.transform_json(json_hash['authority'], json_hash['_authority']) unless json_hash['authority'].nil?
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?

      result
    end
  end
end
