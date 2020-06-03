module FHIR
  class ActivityParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityParticipantType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
