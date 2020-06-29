module FHIR
  # fhir/test_report_setup_action.rb
  class TestReportSetupAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportSetupAction'
    embeds_one :operation, class_name: 'TestReportSetupActionOperation'
    embeds_one :assert, class_name: 'TestReportSetupActionAssert'

    def self.transform_json(json_hash, target=TestReportSetupAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestReportSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['assert'] = TestReportSetupActionAssert.transform_json(json_hash['assert']) unless json_hash['assert'].nil?      

      result
    end
  end
end
