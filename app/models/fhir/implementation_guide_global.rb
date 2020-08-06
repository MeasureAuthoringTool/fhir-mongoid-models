module FHIR
  # fhir/implementation_guide_global.rb
  class ImplementationGuideGlobal < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ResourceType'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.value
        serialized = Extension.serializePrimitiveExtension(self.profile)            
        result['_profile'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideGlobal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ResourceType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?

      result
    end
  end
end
