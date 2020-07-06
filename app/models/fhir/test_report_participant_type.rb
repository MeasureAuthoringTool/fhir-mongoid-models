module FHIR
  # fhir/test_report_participant_type.rb
  class TestReportParticipantType < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = TestReportParticipantType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
