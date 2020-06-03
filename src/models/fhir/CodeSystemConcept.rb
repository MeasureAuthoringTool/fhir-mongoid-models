module FHIR
  class CodeSystemConcept < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemConcept'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    embeds_many :designation, class_name: 'CodeSystemConceptDesignation'
    embeds_many :property, class_name: 'CodeSystemConceptProperty'
    embeds_many :concept, class_name: 'CodeSystemConcept'
  end
end
