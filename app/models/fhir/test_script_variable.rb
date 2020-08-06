module FHIR
  # fhir/test_script_variable.rb
  class TestScriptVariable < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :defaultValue, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :headerField, class_name: 'FHIR::PrimitiveString'    
    embeds_one :hint, class_name: 'FHIR::PrimitiveString'    
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :sourceId, class_name: 'FHIR::PrimitiveId'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.defaultValue.nil? 
        result['defaultValue'] = self.defaultValue.value
        serialized = Extension.serializePrimitiveExtension(self.defaultValue)            
        result['_defaultValue'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.value
        serialized = Extension.serializePrimitiveExtension(self.expression)            
        result['_expression'] = serialized unless serialized.nil?
      end
      unless self.headerField.nil? 
        result['headerField'] = self.headerField.value
        serialized = Extension.serializePrimitiveExtension(self.headerField)            
        result['_headerField'] = serialized unless serialized.nil?
      end
      unless self.hint.nil? 
        result['hint'] = self.hint.value
        serialized = Extension.serializePrimitiveExtension(self.hint)            
        result['_hint'] = serialized unless serialized.nil?
      end
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = TestScriptVariable.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['defaultValue'] = PrimitiveString.transform_json(json_hash['defaultValue'], json_hash['_defaultValue']) unless json_hash['defaultValue'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?
      result['headerField'] = PrimitiveString.transform_json(json_hash['headerField'], json_hash['_headerField']) unless json_hash['headerField'].nil?
      result['hint'] = PrimitiveString.transform_json(json_hash['hint'], json_hash['_hint']) unless json_hash['hint'].nil?
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['sourceId'] = PrimitiveId.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?

      result
    end
  end
end
