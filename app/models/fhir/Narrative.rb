module FHIR
  class Narrative < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Narrative'
    embeds_one :status, class_name: 'NarrativeStatus'
    field :div, type:  # primitive
    embeds_one :_div, class_name: 'Extension'
  end
end
