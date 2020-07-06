module FHIR
  # fhir/test_report_teardown_action.rb
  class TestReportTeardownAction < BackboneElement
    include Mongoid::Document
    embeds_one :operation, class_name: 'TestReportSetupActionOperation'

    def self.transform_json(json_hash, target = TestReportTeardownAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestReportSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      

      result
    end
  end
end
