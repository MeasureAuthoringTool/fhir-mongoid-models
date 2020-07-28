module FHIR
  # fhir/test_script_setup_action_operation.rb
  class TestScriptSetupActionOperation < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::Coding'    
    embeds_one :resource, class_name: 'FHIR::FHIRDefinedType'    
    embeds_one :label, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :accept, class_name: 'FHIR::MimeType'    
    embeds_one :contentType, class_name: 'FHIR::MimeType'    
    embeds_one :destination, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :encodeRequestUrl, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :method, class_name: 'FHIR::TestScriptRequestMethodCode'    
    embeds_one :origin, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :params, class_name: 'FHIR::PrimitiveString'    
    embeds_many :requestHeader, class_name: 'FHIR::TestScriptSetupActionOperationRequestHeader'    
    embeds_one :requestId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :responseId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :sourceId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :targetId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :url, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = TestScriptSetupActionOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['resource'] = FHIRDefinedType.transform_json(json_hash['resource']) unless json_hash['resource'].nil?
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['accept'] = MimeType.transform_json(json_hash['accept']) unless json_hash['accept'].nil?
      result['contentType'] = MimeType.transform_json(json_hash['contentType']) unless json_hash['contentType'].nil?
      result['destination'] = PrimitiveInteger.transform_json(json_hash['destination'], json_hash['_destination']) unless json_hash['destination'].nil?
      result['encodeRequestUrl'] = PrimitiveBoolean.transform_json(json_hash['encodeRequestUrl'], json_hash['_encodeRequestUrl']) unless json_hash['encodeRequestUrl'].nil?
      result['method'] = TestScriptRequestMethodCode.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['origin'] = PrimitiveInteger.transform_json(json_hash['origin'], json_hash['_origin']) unless json_hash['origin'].nil?
      result['params'] = PrimitiveString.transform_json(json_hash['params'], json_hash['_params']) unless json_hash['params'].nil?
      result['requestHeader'] = json_hash['requestHeader'].map { |var| TestScriptSetupActionOperationRequestHeader.transform_json(var) } unless json_hash['requestHeader'].nil?
      result['requestId'] = PrimitiveId.transform_json(json_hash['requestId'], json_hash['_requestId']) unless json_hash['requestId'].nil?
      result['responseId'] = PrimitiveId.transform_json(json_hash['responseId'], json_hash['_responseId']) unless json_hash['responseId'].nil?
      result['sourceId'] = PrimitiveId.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?
      result['targetId'] = PrimitiveId.transform_json(json_hash['targetId'], json_hash['_targetId']) unless json_hash['targetId'].nil?
      result['url'] = PrimitiveString.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?

      result
    end
  end
end
