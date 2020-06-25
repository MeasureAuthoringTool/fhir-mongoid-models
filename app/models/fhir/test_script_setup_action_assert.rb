module FHIR
  # fhir/test_script_setup_action_assert.rb
  class TestScriptSetupActionAssert < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetupActionAssert'
    embeds_one :label, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :direction, class_name: 'AssertionDirectionType'
    embeds_one :compareToSourceId, class_name: 'PrimitiveString'
    embeds_one :compareToSourceExpression, class_name: 'PrimitiveString'
    embeds_one :compareToSourcePath, class_name: 'PrimitiveString'
    embeds_one :contentType, class_name: 'MimeType'
    embeds_one :expression, class_name: 'PrimitiveString'
    embeds_one :headerField, class_name: 'PrimitiveString'
    embeds_one :minimumId, class_name: 'PrimitiveString'
    embeds_one :navigationLinks, class_name: 'PrimitiveBoolean'
    embeds_one :operator, class_name: 'AssertionOperatorType'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :requestMethod, class_name: 'TestScriptRequestMethodCode'
    embeds_one :requestURL, class_name: 'PrimitiveString'
    embeds_one :resource, class_name: 'FHIRDefinedType'
    embeds_one :response, class_name: 'AssertionResponseTypes'
    embeds_one :responseCode, class_name: 'PrimitiveString'
    embeds_one :sourceId, class_name: 'PrimitiveId'
    embeds_one :validateProfileId, class_name: 'PrimitiveId'
    embeds_one :value, class_name: 'PrimitiveString'
    embeds_one :warningOnly, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = TestScriptSetupActionAssert.new
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['direction'] = AssertionDirectionType.transform_json(json_hash['direction']) unless json_hash['direction'].nil?      
      result['compareToSourceId'] = PrimitiveString.transform_json(json_hash['compareToSourceId'], json_hash['_compareToSourceId']) unless json_hash['compareToSourceId'].nil?      
      result['compareToSourceExpression'] = PrimitiveString.transform_json(json_hash['compareToSourceExpression'], json_hash['_compareToSourceExpression']) unless json_hash['compareToSourceExpression'].nil?      
      result['compareToSourcePath'] = PrimitiveString.transform_json(json_hash['compareToSourcePath'], json_hash['_compareToSourcePath']) unless json_hash['compareToSourcePath'].nil?      
      result['contentType'] = MimeType.transform_json(json_hash['contentType']) unless json_hash['contentType'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['headerField'] = PrimitiveString.transform_json(json_hash['headerField'], json_hash['_headerField']) unless json_hash['headerField'].nil?      
      result['minimumId'] = PrimitiveString.transform_json(json_hash['minimumId'], json_hash['_minimumId']) unless json_hash['minimumId'].nil?      
      result['navigationLinks'] = PrimitiveBoolean.transform_json(json_hash['navigationLinks'], json_hash['_navigationLinks']) unless json_hash['navigationLinks'].nil?      
      result['operator'] = AssertionOperatorType.transform_json(json_hash['operator']) unless json_hash['operator'].nil?      
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['requestMethod'] = TestScriptRequestMethodCode.transform_json(json_hash['requestMethod']) unless json_hash['requestMethod'].nil?      
      result['requestURL'] = PrimitiveString.transform_json(json_hash['requestURL'], json_hash['_requestURL']) unless json_hash['requestURL'].nil?      
      result['resource'] = FHIRDefinedType.transform_json(json_hash['resource']) unless json_hash['resource'].nil?      
      result['response'] = AssertionResponseTypes.transform_json(json_hash['response']) unless json_hash['response'].nil?      
      result['responseCode'] = PrimitiveString.transform_json(json_hash['responseCode'], json_hash['_responseCode']) unless json_hash['responseCode'].nil?      
      result['sourceId'] = PrimitiveId.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?      
      result['validateProfileId'] = PrimitiveId.transform_json(json_hash['validateProfileId'], json_hash['_validateProfileId']) unless json_hash['validateProfileId'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['warningOnly'] = PrimitiveBoolean.transform_json(json_hash['warningOnly'], json_hash['_warningOnly']) unless json_hash['warningOnly'].nil?      

      result
    end
  end
end
