module FHIR
  # fhir/test_report_setup_action.rb
  class TestReportSetupAction < BackboneElement
    include Mongoid::Document
    embeds_one :operation, class_name: 'FHIR::TestReportSetupActionOperation'    
    embeds_one :assert, class_name: 'FHIR::TestReportSetupActionAssert'    
    
    def as_json(*args)
      result = super      
      unless self.operation.nil? 
        result['operation'] = self.operation.as_json(*args)
      end
      unless self.assert.nil? 
        result['assert'] = self.assert.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReportSetupAction.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestReportSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?
      result['assert'] = TestReportSetupActionAssert.transform_json(json_hash['assert']) unless json_hash['assert'].nil?

      result
    end
  end
end
