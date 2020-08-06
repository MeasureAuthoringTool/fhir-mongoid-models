module FHIR
  # fhir/implementation_guide_depends_on.rb
  class ImplementationGuideDependsOn < BackboneElement
    include Mongoid::Document
    embeds_one :uri, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :packageId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      unless self.packageId.nil? 
        result['packageId'] = self.packageId.value
        serialized = Extension.serializePrimitiveExtension(self.packageId)            
        result['_packageId'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideDependsOn.new)
      result = self.superclass.transform_json(json_hash, target)
      result['uri'] = PrimitiveCanonical.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['packageId'] = PrimitiveId.transform_json(json_hash['packageId'], json_hash['_packageId']) unless json_hash['packageId'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?

      result
    end
  end
end
