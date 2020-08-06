module FHIR
  # fhir/test_script_setup_action_assert.rb
  class TestScriptSetupActionAssert < BackboneElement
    include Mongoid::Document
    embeds_one :label, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :direction, class_name: 'FHIR::AssertionDirectionType'    
    embeds_one :compareToSourceId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :compareToSourceExpression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :compareToSourcePath, class_name: 'FHIR::PrimitiveString'    
    embeds_one :contentType, class_name: 'FHIR::MimeType'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :headerField, class_name: 'FHIR::PrimitiveString'    
    embeds_one :minimumId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :navigationLinks, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :operator, class_name: 'FHIR::AssertionOperatorType'    
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :requestMethod, class_name: 'FHIR::TestScriptRequestMethodCode'    
    embeds_one :requestURL, class_name: 'FHIR::PrimitiveString'    
    embeds_one :resource, class_name: 'FHIR::FHIRDefinedType'    
    embeds_one :response, class_name: 'FHIR::AssertionResponseTypes'    
    embeds_one :responseCode, class_name: 'FHIR::PrimitiveString'    
    embeds_one :sourceId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :validateProfileId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :warningOnly, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.label.nil? 
        result['label'] = self.label.value
        serialized = Extension.serializePrimitiveExtension(self.label)            
        result['_label'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.direction.nil? 
        result['direction'] = self.direction.value
        serialized = Extension.serializePrimitiveExtension(self.direction)            
        result['_direction'] = serialized unless serialized.nil?
      end
      unless self.compareToSourceId.nil? 
        result['compareToSourceId'] = self.compareToSourceId.value
        serialized = Extension.serializePrimitiveExtension(self.compareToSourceId)            
        result['_compareToSourceId'] = serialized unless serialized.nil?
      end
      unless self.compareToSourceExpression.nil? 
        result['compareToSourceExpression'] = self.compareToSourceExpression.value
        serialized = Extension.serializePrimitiveExtension(self.compareToSourceExpression)            
        result['_compareToSourceExpression'] = serialized unless serialized.nil?
      end
      unless self.compareToSourcePath.nil? 
        result['compareToSourcePath'] = self.compareToSourcePath.value
        serialized = Extension.serializePrimitiveExtension(self.compareToSourcePath)            
        result['_compareToSourcePath'] = serialized unless serialized.nil?
      end
      unless self.contentType.nil? 
        result['contentType'] = self.contentType.value
        serialized = Extension.serializePrimitiveExtension(self.contentType)            
        result['_contentType'] = serialized unless serialized.nil?
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
      unless self.minimumId.nil? 
        result['minimumId'] = self.minimumId.value
        serialized = Extension.serializePrimitiveExtension(self.minimumId)            
        result['_minimumId'] = serialized unless serialized.nil?
      end
      unless self.navigationLinks.nil? 
        result['navigationLinks'] = self.navigationLinks.value
        serialized = Extension.serializePrimitiveExtension(self.navigationLinks)            
        result['_navigationLinks'] = serialized unless serialized.nil?
      end
      unless self.operator.nil? 
        result['operator'] = self.operator.value
        serialized = Extension.serializePrimitiveExtension(self.operator)            
        result['_operator'] = serialized unless serialized.nil?
      end
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      unless self.requestMethod.nil? 
        result['requestMethod'] = self.requestMethod.value
        serialized = Extension.serializePrimitiveExtension(self.requestMethod)            
        result['_requestMethod'] = serialized unless serialized.nil?
      end
      unless self.requestURL.nil? 
        result['requestURL'] = self.requestURL.value
        serialized = Extension.serializePrimitiveExtension(self.requestURL)            
        result['_requestURL'] = serialized unless serialized.nil?
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.value
        serialized = Extension.serializePrimitiveExtension(self.resource)            
        result['_resource'] = serialized unless serialized.nil?
      end
      unless self.response.nil? 
        result['response'] = self.response.value
        serialized = Extension.serializePrimitiveExtension(self.response)            
        result['_response'] = serialized unless serialized.nil?
      end
      unless self.responseCode.nil? 
        result['responseCode'] = self.responseCode.value
        serialized = Extension.serializePrimitiveExtension(self.responseCode)            
        result['_responseCode'] = serialized unless serialized.nil?
      end
      unless self.sourceId.nil? 
        result['sourceId'] = self.sourceId.value
        serialized = Extension.serializePrimitiveExtension(self.sourceId)            
        result['_sourceId'] = serialized unless serialized.nil?
      end
      unless self.validateProfileId.nil? 
        result['validateProfileId'] = self.validateProfileId.value
        serialized = Extension.serializePrimitiveExtension(self.validateProfileId)            
        result['_validateProfileId'] = serialized unless serialized.nil?
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.warningOnly.nil? 
        result['warningOnly'] = self.warningOnly.value
        serialized = Extension.serializePrimitiveExtension(self.warningOnly)            
        result['_warningOnly'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptSetupActionAssert.new)
      result = self.superclass.transform_json(json_hash, target)
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['direction'] = AssertionDirectionType.transform_json(json_hash['direction'], json_hash['_direction']) unless json_hash['direction'].nil?
      result['compareToSourceId'] = PrimitiveString.transform_json(json_hash['compareToSourceId'], json_hash['_compareToSourceId']) unless json_hash['compareToSourceId'].nil?
      result['compareToSourceExpression'] = PrimitiveString.transform_json(json_hash['compareToSourceExpression'], json_hash['_compareToSourceExpression']) unless json_hash['compareToSourceExpression'].nil?
      result['compareToSourcePath'] = PrimitiveString.transform_json(json_hash['compareToSourcePath'], json_hash['_compareToSourcePath']) unless json_hash['compareToSourcePath'].nil?
      result['contentType'] = MimeType.transform_json(json_hash['contentType'], json_hash['_contentType']) unless json_hash['contentType'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?
      result['headerField'] = PrimitiveString.transform_json(json_hash['headerField'], json_hash['_headerField']) unless json_hash['headerField'].nil?
      result['minimumId'] = PrimitiveString.transform_json(json_hash['minimumId'], json_hash['_minimumId']) unless json_hash['minimumId'].nil?
      result['navigationLinks'] = PrimitiveBoolean.transform_json(json_hash['navigationLinks'], json_hash['_navigationLinks']) unless json_hash['navigationLinks'].nil?
      result['operator'] = AssertionOperatorType.transform_json(json_hash['operator'], json_hash['_operator']) unless json_hash['operator'].nil?
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['requestMethod'] = TestScriptRequestMethodCode.transform_json(json_hash['requestMethod'], json_hash['_requestMethod']) unless json_hash['requestMethod'].nil?
      result['requestURL'] = PrimitiveString.transform_json(json_hash['requestURL'], json_hash['_requestURL']) unless json_hash['requestURL'].nil?
      result['resource'] = FHIRDefinedType.transform_json(json_hash['resource'], json_hash['_resource']) unless json_hash['resource'].nil?
      result['response'] = AssertionResponseTypes.transform_json(json_hash['response'], json_hash['_response']) unless json_hash['response'].nil?
      result['responseCode'] = PrimitiveString.transform_json(json_hash['responseCode'], json_hash['_responseCode']) unless json_hash['responseCode'].nil?
      result['sourceId'] = PrimitiveId.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?
      result['validateProfileId'] = PrimitiveId.transform_json(json_hash['validateProfileId'], json_hash['_validateProfileId']) unless json_hash['validateProfileId'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['warningOnly'] = PrimitiveBoolean.transform_json(json_hash['warningOnly'], json_hash['_warningOnly']) unless json_hash['warningOnly'].nil?

      result
    end
  end
end
