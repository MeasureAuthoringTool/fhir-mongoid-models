module FHIR
  # fhir/test_report_result.rb
  class TestReportResult < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportResult'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TestReportResult.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
