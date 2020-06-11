module FHIR
  class EncounterLocationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterLocationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
