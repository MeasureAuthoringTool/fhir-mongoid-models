module FHIR
  # fhir/graph_definition_link_target_compartment.rb
  class GraphDefinitionLinkTargetCompartment < BackboneElement
    include Mongoid::Document
    embeds_one :use, class_name: 'FHIR::GraphCompartmentUse'    
    embeds_one :code, class_name: 'FHIR::CompartmentCode'    
    embeds_one :rule, class_name: 'FHIR::GraphCompartmentRule'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.rule.nil? 
        result['rule'] = self.rule.value
        serialized = Extension.serializePrimitiveExtension(self.rule)            
        result['_rule'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.value
        serialized = Extension.serializePrimitiveExtension(self.expression)            
        result['_expression'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GraphDefinitionLinkTargetCompartment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = GraphCompartmentUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['code'] = CompartmentCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['rule'] = GraphCompartmentRule.transform_json(json_hash['rule'], json_hash['_rule']) unless json_hash['rule'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?

      result
    end
  end
end
