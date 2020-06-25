module FHIR
  # fhir/test_report_participant_type.rb
  class TestReportParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportParticipantType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TestReportParticipantType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
