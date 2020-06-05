module FHIR
  class EncounterClassHistory < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterClassHistory'
    embeds_one :class, class_name: 'Coding'
    embeds_one :period, class_name: 'Period'
  end
end
