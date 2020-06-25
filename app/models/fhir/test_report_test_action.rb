module FHIR
  # fhir/test_report_test_action.rb
  class TestReportTestAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportTestAction'
    embeds_one :operation, class_name: 'TestReportSetupActionOperation'
    embeds_one :assert, class_name: 'TestReportSetupActionAssert'

    def self.transform_json(json_hash)
      result = TestReportTestAction.new
      result['operation'] = TestReportSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['assert'] = TestReportSetupActionAssert.transform_json(json_hash['assert']) unless json_hash['assert'].nil?      

      result
    end
  end
end
