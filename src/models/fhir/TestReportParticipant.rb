module FHIR
  class TestReportParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportParticipant'
    embeds_one :type, class_name: 'TestReportParticipantType'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
  end
end
