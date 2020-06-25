module FHIR
  # fhir/test_report_action_result.rb
  class TestReportActionResult < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportActionResult'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TestReportActionResult.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
