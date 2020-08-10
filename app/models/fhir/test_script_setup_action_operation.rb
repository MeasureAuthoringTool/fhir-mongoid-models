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
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.value
        serialized = Extension.serializePrimitiveExtension(self.resource)            
        result['_resource'] = serialized unless serialized.nil?
      end
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
      unless self.accept.nil? 
        result['accept'] = self.accept.value
        serialized = Extension.serializePrimitiveExtension(self.accept)            
        result['_accept'] = serialized unless serialized.nil?
      end
      unless self.contentType.nil? 
        result['contentType'] = self.contentType.value
        serialized = Extension.serializePrimitiveExtension(self.contentType)            
        result['_contentType'] = serialized unless serialized.nil?
      end
      unless self.destination.nil? 
        result['destination'] = self.destination.value
        serialized = Extension.serializePrimitiveExtension(self.destination)            
        result['_destination'] = serialized unless serialized.nil?
      end
      unless self.encodeRequestUrl.nil? 
        result['encodeRequestUrl'] = self.encodeRequestUrl.value
        serialized = Extension.serializePrimitiveExtension(self.encodeRequestUrl)            
        result['_encodeRequestUrl'] = serialized unless serialized.nil?
      end
      unless self.method.nil? 
        result['method'] = self.method.value
        serialized = Extension.serializePrimitiveExtension(self.method)            
        result['_method'] = serialized unless serialized.nil?
      end
      unless self.origin.nil? 
        result['origin'] = self.origin.value
        serialized = Extension.serializePrimitiveExtension(self.origin)            
        result['_origin'] = serialized unless serialized.nil?
      end
      unless self.params.nil? 
        result['params'] = self.params.value
        serialized = Extension.serializePrimitiveExtension(self.params)            
        result['_params'] = serialized unless serialized.nil?
      end
      unless self.requestHeader.nil?  || !self.requestHeader.any? 
        result['requestHeader'] = self.requestHeader.map{ |x| x.as_json(*args) }
      end
      unless self.requestId.nil? 
        result['requestId'] = self.requestId.value
        serialized = Extension.serializePrimitiveExtension(self.requestId)            
        result['_requestId'] = serialized unless serialized.nil?
      end
      unless self.responseId.nil? 
        result['responseId'] = self.responseId.value
        serialized = Extension.serializePrimitiveExtension(self.responseId)            
        result['_responseId'] = serialized unless serialized.nil?
      end
      unless self.sourceId.nil? 
        result['sourceId'] = self.sourceId.value
        serialized = Extension.serializePrimitiveExtension(self.sourceId)            
        result['_sourceId'] = serialized unless serialized.nil?
      end
      unless self.targetId.nil? 
        result['targetId'] = self.targetId.value
        serialized = Extension.serializePrimitiveExtension(self.targetId)            
        result['_targetId'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptSetupActionOperation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['resource'] = FHIRDefinedType.transform_json(json_hash['resource'], json_hash['_resource']) unless json_hash['resource'].nil?
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['accept'] = MimeType.transform_json(json_hash['accept'], json_hash['_accept']) unless json_hash['accept'].nil?
      result['contentType'] = MimeType.transform_json(json_hash['contentType'], json_hash['_contentType']) unless json_hash['contentType'].nil?
      result['destination'] = PrimitiveInteger.transform_json(json_hash['destination'], json_hash['_destination']) unless json_hash['destination'].nil?
      result['encodeRequestUrl'] = PrimitiveBoolean.transform_json(json_hash['encodeRequestUrl'], json_hash['_encodeRequestUrl']) unless json_hash['encodeRequestUrl'].nil?
      result['method'] = TestScriptRequestMethodCode.transform_json(json_hash['method'], json_hash['_method']) unless json_hash['method'].nil?
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
