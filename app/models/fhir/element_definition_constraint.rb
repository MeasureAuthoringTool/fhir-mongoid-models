module FHIR
  # fhir/element_definition_constraint.rb
  class ElementDefinitionConstraint < Element
    include Mongoid::Document
    embeds_one :key, class_name: 'FHIR::PrimitiveId'    
    embeds_one :requirements, class_name: 'FHIR::PrimitiveString'    
    embeds_one :severity, class_name: 'FHIR::ConstraintSeverity'    
    embeds_one :human, class_name: 'FHIR::PrimitiveString'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :xpath, class_name: 'FHIR::PrimitiveString'    
    embeds_one :source, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.key.nil? 
        result['key'] = self.key.value
        serialized = Extension.serializePrimitiveExtension(self.key)            
        result['_key'] = serialized unless serialized.nil?
      end
      unless self.requirements.nil? 
        result['requirements'] = self.requirements.value
        serialized = Extension.serializePrimitiveExtension(self.requirements)            
        result['_requirements'] = serialized unless serialized.nil?
      end
      unless self.severity.nil? 
        result['severity'] = self.severity.value
        serialized = Extension.serializePrimitiveExtension(self.severity)            
        result['_severity'] = serialized unless serialized.nil?
      end
      unless self.human.nil? 
        result['human'] = self.human.value
        serialized = Extension.serializePrimitiveExtension(self.human)            
        result['_human'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.value
        serialized = Extension.serializePrimitiveExtension(self.expression)            
        result['_expression'] = serialized unless serialized.nil?
      end
      unless self.xpath.nil? 
        result['xpath'] = self.xpath.value
        serialized = Extension.serializePrimitiveExtension(self.xpath)            
        result['_xpath'] = serialized unless serialized.nil?
      end
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinitionConstraint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['key'] = PrimitiveId.transform_json(json_hash['key'], json_hash['_key']) unless json_hash['key'].nil?
      result['requirements'] = PrimitiveString.transform_json(json_hash['requirements'], json_hash['_requirements']) unless json_hash['requirements'].nil?
      result['severity'] = ConstraintSeverity.transform_json(json_hash['severity'], json_hash['_severity']) unless json_hash['severity'].nil?
      result['human'] = PrimitiveString.transform_json(json_hash['human'], json_hash['_human']) unless json_hash['human'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?
      result['xpath'] = PrimitiveString.transform_json(json_hash['xpath'], json_hash['_xpath']) unless json_hash['xpath'].nil?
      result['source'] = PrimitiveCanonical.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?

      result
    end
  end
end
