module FHIR
  # fhir/test_script_teardown_action.rb
  class TestScriptTeardownAction < BackboneElement
    include Mongoid::Document
    embeds_one :operation, class_name: 'FHIR::TestScriptSetupActionOperation'    
    
    def as_json(*args)
      result = super      
      unless self.operation.nil? 
        result['operation'] = self.operation.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptTeardownAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestScriptSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?

      result
    end
  end
end
