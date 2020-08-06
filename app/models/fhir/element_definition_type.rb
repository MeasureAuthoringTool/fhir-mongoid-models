module FHIR
  # fhir/element_definition_type.rb
  class ElementDefinitionType < Element
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :targetProfile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :versioning, class_name: 'FHIR::ReferenceVersionRules'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.targetProfile.nil?  || !self.targetProfile.any? 
        result['targetProfile'] = self.targetProfile.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.targetProfile)                              
        result['_targetProfile'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.versioning.nil? 
        result['versioning'] = self.versioning.value
        serialized = Extension.serializePrimitiveExtension(self.versioning)            
        result['_versioning'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinitionType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveUri.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['targetProfile'] = json_hash['targetProfile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetProfile'] && json_hash['_targetProfile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['targetProfile'].nil?
      result['versioning'] = ReferenceVersionRules.transform_json(json_hash['versioning'], json_hash['_versioning']) unless json_hash['versioning'].nil?

      result
    end
  end
end
