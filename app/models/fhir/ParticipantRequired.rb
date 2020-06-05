module FHIR
  class ParticipantRequired < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParticipantRequired'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
