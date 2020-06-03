module FHIR
  class ValueSetComposeIncludeConcept < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeIncludeConcept'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    embeds_many :designation, class_name: 'ValueSetComposeIncludeConceptDesignation'
  end
end
