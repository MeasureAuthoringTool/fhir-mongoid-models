module FHIR
  class ActionParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionParticipantType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
