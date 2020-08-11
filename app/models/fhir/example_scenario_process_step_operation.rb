module FHIR
  # fhir/example_scenario_process_step_operation.rb
  class ExampleScenarioProcessStepOperation < BackboneElement
    include Mongoid::Document
    embeds_one :number, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :initiator, class_name: 'FHIR::PrimitiveString'    
    embeds_one :receiver, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :initiatorActive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :receiverActive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :request, class_name: 'FHIR::ExampleScenarioInstanceContainedInstance'    
    embeds_one :response, class_name: 'FHIR::ExampleScenarioInstanceContainedInstance'    
    
    def as_json(*args)
      result = super      
      unless self.number.nil? 
        result['number'] = self.number.value
        serialized = Extension.serializePrimitiveExtension(self.number)            
        result['_number'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.initiator.nil? 
        result['initiator'] = self.initiator.value
        serialized = Extension.serializePrimitiveExtension(self.initiator)            
        result['_initiator'] = serialized unless serialized.nil?
      end
      unless self.receiver.nil? 
        result['receiver'] = self.receiver.value
        serialized = Extension.serializePrimitiveExtension(self.receiver)            
        result['_receiver'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.initiatorActive.nil? 
        result['initiatorActive'] = self.initiatorActive.value
        serialized = Extension.serializePrimitiveExtension(self.initiatorActive)            
        result['_initiatorActive'] = serialized unless serialized.nil?
      end
      unless self.receiverActive.nil? 
        result['receiverActive'] = self.receiverActive.value
        serialized = Extension.serializePrimitiveExtension(self.receiverActive)            
        result['_receiverActive'] = serialized unless serialized.nil?
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.response.nil? 
        result['response'] = self.response.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioProcessStepOperation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['number'] = PrimitiveString.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['initiator'] = PrimitiveString.transform_json(json_hash['initiator'], json_hash['_initiator']) unless json_hash['initiator'].nil?
      result['receiver'] = PrimitiveString.transform_json(json_hash['receiver'], json_hash['_receiver']) unless json_hash['receiver'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['initiatorActive'] = PrimitiveBoolean.transform_json(json_hash['initiatorActive'], json_hash['_initiatorActive']) unless json_hash['initiatorActive'].nil?
      result['receiverActive'] = PrimitiveBoolean.transform_json(json_hash['receiverActive'], json_hash['_receiverActive']) unless json_hash['receiverActive'].nil?
      result['request'] = ExampleScenarioInstanceContainedInstance.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['response'] = ExampleScenarioInstanceContainedInstance.transform_json(json_hash['response']) unless json_hash['response'].nil?

      result
    end
  end
end
