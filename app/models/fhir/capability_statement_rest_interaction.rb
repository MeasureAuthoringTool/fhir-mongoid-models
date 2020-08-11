module FHIR
  # fhir/capability_statement_rest_interaction.rb
  class CapabilityStatementRestInteraction < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::SystemRestfulInteraction'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementRestInteraction.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = SystemRestfulInteraction.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
