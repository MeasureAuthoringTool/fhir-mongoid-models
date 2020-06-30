module FHIR
  # fhir/test_report_setup_action_operation.rb
  class TestReportSetupActionOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportSetupActionOperation'
    embeds_one :result, class_name: 'TestReportActionResult'
    embeds_one :message, class_name: 'PrimitiveMarkdown'
    embeds_one :detail, class_name: 'PrimitiveUri'

    def self.transform_json(json_hash, target=TestReportSetupActionOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['result'] = TestReportActionResult.transform_json(json_hash['result']) unless json_hash['result'].nil?      
      result['message'] = PrimitiveMarkdown.transform_json(json_hash['message'], json_hash['_message']) unless json_hash['message'].nil?      
      result['detail'] = PrimitiveUri.transform_json(json_hash['detail'], json_hash['_detail']) unless json_hash['detail'].nil?      

      result
    end
  end
end
