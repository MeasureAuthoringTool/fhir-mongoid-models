module FHIR
  # fhir/test_report_teardown_action.rb
  class TestReportTeardownAction < BackboneElement
    include Mongoid::Document
    embeds_one :operation, class_name: 'FHIR::TestReportSetupActionOperation'    
    
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

    def self.transform_json(json_hash, target = TestReportTeardownAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestReportSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?

      result
    end
  end
end
