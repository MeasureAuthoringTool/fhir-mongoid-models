module FHIR
  # fhir/test_report_teardown.rb
  class TestReportTeardown < BackboneElement
    include Mongoid::Document
    embeds_many :action, class_name: 'FHIR::TestReportTeardownAction'    
    
    def as_json(*args)
      result = super      
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReportTeardown.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = json_hash['action'].map { |var| TestReportTeardownAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
