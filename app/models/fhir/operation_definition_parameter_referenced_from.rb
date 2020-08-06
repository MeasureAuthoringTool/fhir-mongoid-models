module FHIR
  # fhir/operation_definition_parameter_referenced_from.rb
  class OperationDefinitionParameterReferencedFrom < BackboneElement
    include Mongoid::Document
    embeds_one :source, class_name: 'FHIR::PrimitiveString'    
    embeds_one :sourceId, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.sourceId.nil? 
        result['sourceId'] = self.sourceId.value
        serialized = Extension.serializePrimitiveExtension(self.sourceId)            
        result['_sourceId'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationDefinitionParameterReferencedFrom.new)
      result = self.superclass.transform_json(json_hash, target)
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['sourceId'] = PrimitiveString.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?

      result
    end
  end
end
