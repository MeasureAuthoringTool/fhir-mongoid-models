module FHIR
  class TestReportParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportParticipantType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
