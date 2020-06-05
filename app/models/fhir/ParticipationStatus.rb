module FHIR
  class ParticipationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParticipationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
