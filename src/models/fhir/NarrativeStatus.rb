module FHIR
  class NarrativeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NarrativeStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
